class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :author, :title, :rendered_content, presence: true

  def original_content=(markdown)
    self[:original_content] = markdown
    self[:rendered_content] = markdown
  end
end
