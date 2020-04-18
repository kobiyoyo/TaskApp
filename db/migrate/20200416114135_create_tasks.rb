class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :hours
      t.references :author, index: true

      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :author_id
  end
end