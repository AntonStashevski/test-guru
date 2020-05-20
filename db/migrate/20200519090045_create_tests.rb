class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :difficulty, null: false

      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
