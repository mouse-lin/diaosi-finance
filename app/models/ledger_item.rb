class LedgerItem < ActiveRecord::Base

  attr_accessible :user, :ledger, :partner_public_consumes, :private_consumes, :bills, :price, :pay_monery

  belongs_to :ledger
  belongs_to :user

  has_many :partner_public_consumes
  has_many :private_consumes
  has_many :bills

end
