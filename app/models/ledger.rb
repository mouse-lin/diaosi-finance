class Ledger < ActiveRecord::Base
  attr_accessible :end_date

  has_many :ledger_items, autosave: true, dependent: :delete_all

  before_create :build_items
  after_create :set_total_price

  def build_items
    User.all.each do |user|
      partner_public_consumes = user.public_for_ledger(self.end_date)
      private_consumes = user.private_consumes_for_ledger(self.end_date)
      bills = user.bills_for_ledger(self.end_date)

      ledger_items << LedgerItem.new(
        user: user,
        price: partner_public_consumes.sum(&:consume) + private_consumes.sum(&:cost),
        pay_monery: bills.sum(&:total_price),
        partner_public_consumes: partner_public_consumes,
        private_consumes: private_consumes,
        bills: bills
      )
    end
  end

  def set_total_price
    update_attribute(:total_price, ledger_items.sum(:price))
  end

end
