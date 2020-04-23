class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tasks, dependent: :destroy
  validates :name, presence: true, length: { in: 5..15 }
  validates :icon, presence: true
  validates :user_id, presence: true
end
