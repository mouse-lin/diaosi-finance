class PartnerPublicConsume < ActiveRecord::Base
  belongs_to :bill
  belongs_to :user

  attr_accessor :create_by_bill_association
  attr_accessible :bill_id, :consume, :user_id, :create_by_bill_association

  validates :user_id, :uniqueness => { :scope => :bill_id, :message => "Are you sure lost this guy? Check it!" }

  after_create  :recount_bill_partner_public_sonsumers_price
  after_destroy :recount_bill_partner_public_sonsumers_price!

  private
    def recount_bill_partner_public_sonsumers_price
      recount_bill_partner_public_sonsumers_price! unless self.create_by_bill_association
    end

    def recount_bill_partner_public_sonsumers_price!
      self.bill.count_and_save_partner_public_consumes_price
    end
end
