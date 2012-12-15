class CreateLedgers < ActiveRecord::Migration
  def change
    create_table :ledgers do |t|
      t.date :end_date
      t.float :total_price

      t.timestamps
    end
  end
end
