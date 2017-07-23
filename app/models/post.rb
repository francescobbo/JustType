class Post < ApplicationRecord
  include FriendlyId

  friendly_id :slug_generators, use: :history

  belongs_to :author, class_name: 'User'

  validates :author, :title, :rendered_content, presence: true

  def original_content=(markdown)
    self[:original_content] = markdown
    self[:rendered_content] = markdown
  end

  def slug_generators
    [
      [:title]
    ]
  end
end
