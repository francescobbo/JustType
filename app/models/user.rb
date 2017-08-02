class User < ApplicationRecord
  has_secure_password

  scope :admin, -> { where(admin: true) }

  has_many :articles, foreign_key: :author_id

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def self.authenticate(email, password)
    find_by(email: email)&.authenticate(password)
  end
end
