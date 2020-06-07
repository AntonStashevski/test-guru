module TestPassagesHelper
  def result_statistic
    correct_question_count = @test_passage.correct_question
    questions_count = @test_passage.questions_size

    if questions_count == correct_question_count
      "Вы ответили на все вопросы правильно"
    elsif correct_question_count.zero?
      "Вы ответили на все вопросы неправильно"
    else
      "Вы ответили на #{correct_question_count} из #{questions_count} вопросов"
    end
  end
end
