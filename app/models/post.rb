class Post < ApplicationRecord
  belongs_to :user

  validates :user, :title, :rendered_content, presence: true
end
