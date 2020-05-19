class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :difficulty
      t.integer :category_id

      t.timestamps
    end
  end
end