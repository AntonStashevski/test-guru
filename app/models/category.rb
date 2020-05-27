class Category < ApplicationRecord
  has_many :tests # между тестами и категориями

  default_scope { order(title: :asc) }

  validates :title, presence: true
end
