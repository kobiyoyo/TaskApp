class CreateJoinTableGroupTask < ActiveRecord::Migration[6.0]
  def change
    create_join_table :groups, :tasks do |t|
      # t.index [:group_id, :task_id]
      # t.index [:task_id, :group_id]
    end
  end
end
