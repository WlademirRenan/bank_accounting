class CreateTransferences < ActiveRecord::Migration[5.0]
  def change
    create_table :transferences do |t|
      t.integer :source_account_id
      t.integer :destination_account_id
      t.float :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
