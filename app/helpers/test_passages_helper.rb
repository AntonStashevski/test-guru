module TestPassagesHelper
  def result_statistic
    correct_question_count = @test_passage.correct_question
    questions_count = @test_passage.questions_size

    return "Вы ответили на все вопросы правильно" if questions_count == correct_question_count
    return "Вы ответили на все вопросы неправильно" if correct_question_count.zero?
    "Вы ответили на #{correct_question_count} из #{questions_count} вопросов"
  end
end
