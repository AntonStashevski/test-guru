class AddTestTitleDifficultyNullConstraint < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :difficulty, false)
    change_column_null(:tests, :category_id, false)
  end

  def up
    change_column(:tests, :difficulty, :integer, default: 0)
  end

  def down
    change_column(:tests, :difficulty, :integer, default: null)
  end

end
