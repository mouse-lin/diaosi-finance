class User < AdminUser
  has_many :bills, foreign_key: 'payer_id'
  has_many :private_consumes
  has_many :involved_bills, class_name: 'Bill', through: :private_consume
end
