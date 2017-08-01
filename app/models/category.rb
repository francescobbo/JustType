class Category < ApplicationRecord
  include FriendlyId
  acts_as_nested_set

  friendly_id :name, use: :history
  has_many :posts

  validates :name, presence: true
end
