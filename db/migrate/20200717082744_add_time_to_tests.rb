class AddTimeToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :timer, :integer, null: false, default: 5
  end
end
