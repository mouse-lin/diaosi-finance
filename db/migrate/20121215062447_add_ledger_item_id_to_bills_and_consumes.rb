class AddLedgerItemIdToBillsAndConsumes < ActiveRecord::Migration
  def change
      add_column :partner_public_consumes ,:ledger_item_id, :integer
      add_column :private_consumes ,:ledger_item_id, :integer
      add_column :bills ,:ledger_item_id, :integer
      add_column :ledger_items, :ledger_id, :integer
      add_column :ledger_items, :pay_monery, :float
  end
end
