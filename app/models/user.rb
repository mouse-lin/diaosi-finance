class User < AdminUser
  has_many :bills, foreign_key: 'payer_id'
  has_many :private_consumes

  has_many :partner_public_consumes
  has_many :involved_bills, source: 'Bill', through: :partner_public_consumes

  def bills_for_ledger end_date
    bills.not_counted.where('created_at < ?', end_date)
  end

  def public_for_ledger end_date
    partner_public_consumes.not_counted.where('created_at < ?', end_date)
  end

  def private_consumes_for_ledger end_date
    private_consumes.not_counted.where('created_at < ?', end_date)
  end

end
