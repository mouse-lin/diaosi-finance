class CreatePartnerPublicConsumes < ActiveRecord::Migration
  def change
    create_table :partner_public_consumes do |t|
      t.integer :user_id
      t.integer :bill_id
      t.float :consume

      t.timestamps
    end
  end
end
