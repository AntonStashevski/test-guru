class Category < ApplicationRecord
  has_many :tests # между тестами и категориями
end
