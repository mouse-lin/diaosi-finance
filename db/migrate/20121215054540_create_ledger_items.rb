class CreateLedgerItems < ActiveRecord::Migration
  def change
    create_table :ledger_items do |t|
      t.date :end_date
      t.integer :user_id
      t.float :price

      t.timestamps
    end
  end
end
