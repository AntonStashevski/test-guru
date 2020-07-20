class Badge < ApplicationRecord
  has_many :users_badge
  has_many :users, through: :users_badge
  validates :title, :image_url, :rule, :description, :value, presence: true
end
