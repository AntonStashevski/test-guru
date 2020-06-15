module AnswersHelper
  def correct_answer(answer)
    answer.correct ? "да" : "нет"
  end
end
