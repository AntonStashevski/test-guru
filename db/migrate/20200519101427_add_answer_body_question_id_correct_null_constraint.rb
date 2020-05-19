class AddAnswerBodyQuestionIdCorrectNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :question_id, false)
    change_column_null(:answers, :correct, false)
  end

  def up
    change_column(:answers, :correct, :boolean, default: false)
  end

  def down
    change_column(:answers, :correct, :boolean, default: null)
  end

end
