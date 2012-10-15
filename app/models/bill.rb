class Bill < ActiveRecord::Base
  belongs_to :payer, class_name: 'User'
  has_many :private_consumes
  has_many :partners, class_name: 'User', through: :private_consumes

  # FIXME mass_....
  attr_accessible :number, :partners_count, :payer_id, :total_price

  def name
    "#{number} : #{total_price}"
  end
end
