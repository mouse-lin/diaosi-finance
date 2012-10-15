class PrivateConsume < ActiveRecord::Base
  belongs_to :bill
  belongs_to :user
  attr_accessible :bill, :cost, :user, :bill_id, :user_id

end
