class AddAuthorIdToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :author_id, :integer
    add_index :transactions, :author_id
  end
end
