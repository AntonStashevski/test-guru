class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :description, null: false
      t.string :rule, null: false
      t.string :value, null: false
    end
  end
end
