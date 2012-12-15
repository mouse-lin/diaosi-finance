class AddLedgeredToBillAndCustomer < ActiveRecord::Migration
  def change
    add_column :bills, :counted, :boolean, default: false
    add_column :partner_public_consumes, :counted, :boolean, default: false
    add_column :private_consumes, :counted, :boolean, default: false
  end
end
