class User < AdminUser
  has_many :bills, foreign_key: 'payer_id'
  has_many :private_consumes

  has_many :partner_public_consumes
  has_many :involved_bills, source: 'Bill', through: :partner_public_consumes
  
end
