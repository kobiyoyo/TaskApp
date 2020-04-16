class User < ApplicationRecord
	has_many :groups
	has_many :tasks,foreign_key: 'author_id',dependent: :destroy
	validates :username ,presence: true,uniqueness: true
end