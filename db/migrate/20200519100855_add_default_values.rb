class AddDefaultValues < ActiveRecord::Migration[5.1]

  def up
    change_column(:tests, :difficulty, :integer, default: 0)
    change_column(:answers, :correct, :boolean, default: false)
  end

  def down
    change_column(:tests, :difficulty, :integer, default: nil)
    change_column(:answers, :correct, :boolean, default: nil)
  end

end
