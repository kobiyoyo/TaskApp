class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :amount
      t.string :author_id

      t.timestamps
    end
    add_index :transactions, :author_id
  end
end
