class TestPassage < ApplicationRecord

  SUCCESS_RATE = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  scope :completed_tests, ->(user) { where(user_id: user.id, passed: true) }

  before_validation :before_validation_set_first_question, on: :create

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_question += 1
    end

    self.current_question = next_question
    self.passed = true if complete?
    save
  end

  def passed?
    self.correct_question / questions_size.to_f > SUCCESS_RATE
  end

  def complete?
    current_question.nil?
  end

  def questions_size
    self.test.questions.size
  end

  def question_number
    self.test.questions.index(current_question) + 1
  end

  def expired_time
    (created_at.to_i + self.test.timer * 60) - Time.now.to_i
  end

  def have_time?
    self.created_at.to_i + self.test.timer * 60 > Time.now.to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
