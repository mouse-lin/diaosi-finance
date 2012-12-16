class LedgerItem < ActiveRecord::Base

  attr_accessible :user, :ledger, :partner_public_consumes, :private_consumes, :bills, :price, :pay_monery

  belongs_to :ledger
  belongs_to :user

  has_many :partner_public_consumes
  has_many :private_consumes
  has_many :bills

  after_create :set_bills_and_consumes_status_counted_as_true
  after_destroy :set_bills_and_consumes_status_counted_as_false

  def set_bills_and_consumes_status_counted_as_true
    bills.update_all(counted: true)
    partner_public_consumes.update_all(counted: true)
    private_consumes.update_all(counted: true)
  end

  def set_bills_and_consumes_status_counted_as_false
    bills.update_all(counted: false)
    partner_public_consumes.update_all(counted: false)
    private_consumes.update_all(counted: false)
  end

end
