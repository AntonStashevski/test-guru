class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      if send "#{badge.rule}_tests_completed?", badge.value
        @user.badges << badge
      end
    end
  end

  def first_try_tests_completed?(_value = nil)
    TestPassage.completed_tests(@user).where(test_id: @test_passage.test.id).count == 1
  end

  def category_tests_completed?(category)
    # id всех тестов с нужной категорией
    tests_with_correct_category = Test.tests_by_category_name(category).map(&:id).sort
    # id всех тестов пройденных пользователем с нужной категорией
    completed_test = TestPassage.completed_tests(@user).where(test_id: tests_with_correct_category).map(&:test_id).uniq.sort
    # проверка есть ли уже такая награда + схожесть тестов
    completed_test == tests_with_correct_category && !@user.badges.map(&:value).include?(category)
  end

  def level_tests_completed?(level)
    result = []
    # id всех тестов с нужным уровнем сложности
    tests_with_correct_level = Test.tests_by_level(level).map(&:id).sort
    # id всех тестов пройденных пользователем с нужным уровнем сложности
    TestPassage.completed_tests(@user).map(&:test).each do |test|
      result << test if tests_with_correct_level.include? test.id
    end
    # проверка есть ли уже такая награда + схожесть тестов
    tests_with_correct_level == result.map(&:id).uniq.sort && !@user.badges.map(&:value).include?(level)
  end

end