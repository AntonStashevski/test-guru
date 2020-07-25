class AddCompletedFieldInTestPassage < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :passed, :boolean, null: false, default: false
  end
end
