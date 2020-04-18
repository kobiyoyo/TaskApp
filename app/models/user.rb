class User < ApplicationRecord
  has_many :groups
  has_many :tasks, foreign_key: 'author_id', dependent: :destroy
  has_one_attached :avatar
  validates :username, presence: true
end
