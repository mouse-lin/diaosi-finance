class CreatePrivateConsumes < ActiveRecord::Migration
  def change
    create_table :private_consumes do |t|
      t.integer :user_id
      t.float :cost
      t.integer :bill_id

      t.timestamps
    end
  end
end
