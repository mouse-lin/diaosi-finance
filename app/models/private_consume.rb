class PrivateConsume < ActiveRecord::Base
  belongs_to :bill
  belongs_to :user
  attr_accessible :bill, :cost, :user, :bill_id, :user_id

  scope :counted, where(counted: true)
  scope :not_counted, where(counted: false)

  after_save    :recount_bill_partner_public_sonsumers_price
  after_destroy :recount_bill_partner_public_sonsumers_price

  def recount_bill_partner_public_sonsumers_price
    self.bill.count_and_save_partner_public_consumes_price
  end

end
