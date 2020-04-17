class AddIndexToUser < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :username
  end
end
