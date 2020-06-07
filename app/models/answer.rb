class Answer < ApplicationRecord
  belongs_to :question # между вопросами и ответами

  validates :body, presence: true
  validate :validate_number_of_question_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_number_of_question_answers
    errors.add(:question, "У вопроса не может быть больше 4 ответов") if self.question.answers.count >= 4
  end

end
