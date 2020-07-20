class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      if send "#{badge.rule}_tests_completed?", badge.value
        @test_passage.user.badges << badge
      end
    end
  end

  def first_try_tests_completed?(value = nil)
    TestPassage.where(user_id: @test_passage.user.id).where(current_question: nil).where(test_id: @test_passage.test.id).count == 1
  end

  def category_tests_completed?(category)
    # id нужной нам категории
    category_id = Category.where(title: category).first.id
    # id всех тестов с нужной категорией
    tests_with_correct_category = Test.where(category_id: category_id).map(&:id).sort
    # id всех тестов пройденных пользователем с нужной категорией
    completed_test = @test_passage.user.test_passages.where(current_question_id: nil).where(test_id: tests_with_correct_category).map(&:test_id).uniq.sort
    # проверка есть ли уже такая награда + схожесть тестов
    completed_test == tests_with_correct_category && !@test_passage.user.badges.map(&:value).include?(category)
  end

  def level_tests_completed?(level)
    result = []
    # id всех тестов с нужным уровнем сложности
    tests_with_correct_level = Test.where(difficulty: level).map(&:id).sort
    # id всех тестов пройденных пользователем с нужным уровнем сложности
    @test_passage.user.test_passages.where(current_question_id: nil).map(&:test).each do |test|
      result << test if tests_with_correct_level.include? test.id
    end
    # проверка есть ли уже такая награда + схожесть тестов
    tests_with_correct_level == result.map(&:id).uniq.sort && !@test_passage.user.badges.map(&:value).include?(level)
  end

end