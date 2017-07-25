class Post < ApplicationRecord
  include FriendlyId

  friendly_id :slug_generators, use: :history

  belongs_to :author, class_name: 'User'

  validates :author, :title, :rendered_content, presence: true

  scope :visible, -> { where(published: true).where('published_at < ?', Time.now.utc) }

  def original_content=(markdown)
    self[:original_content] = markdown
    self[:rendered_content] = markdown
  end

  def publish
    self.published = true
    self.published_at ||= Time.now.utc
    nil
  end

  def slug_generators
    [
      [:title]
    ]
  end
end
