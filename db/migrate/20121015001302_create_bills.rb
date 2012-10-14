class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :number
      t.float :total_price
      t.integer :payer_id
      t.integer :partners_count

      t.timestamps
    end
  end
end
