class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups
  validates :name, presence: true
  validates :hours, presence: true
  validates :author_id, presence: true
  scope :not_in_any_group, lambda {
                             joins('LEFT JOIN groups_tasks ON tasks.id = groups_tasks.task_id')
                               .where('groups_tasks.task_id IS NULL')
                           }
end
