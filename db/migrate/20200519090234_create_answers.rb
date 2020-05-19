class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :body
      t.integer :question_id
      t.boolean :correct

      t.timestamps
    end
  end
end