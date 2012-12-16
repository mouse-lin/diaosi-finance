class Bill < ActiveRecord::Base
  belongs_to :payer, class_name: 'User'

  has_many :partner_public_consumes, autosave: true, dependent: :delete_all
  has_many :partners, source: :user, through: :partner_public_consumes

  has_many :private_consumes, dependent: :delete_all

  attr_accessible :number, :partners_count, :payer_id, :total_price, :partner_ids

  after_save :count_and_save_partner_public_consumes_price

  scope :counted, where(counted: true)
  scope :not_counted, where(counted: false)

  def name
    "#{number} $ #{total_price}"
  end

  def partners=(users)
    users && users.each do |user|
      partner = User.find_by_id(user_id) && partner_public_consumes.build(user: partner, create_by_bill_association: true)
    end
  end

  def count_and_save_partner_public_consumes_price
    average_public_consume = (total_price - private_consumes.sum(:cost)) / partner_public_consumes.count.to_f
    partner_public_consumes.update_all(:consume => average_public_consume)
  end

end
