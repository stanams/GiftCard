class RedemptionCard < ActiveRecord::Base

validates :card_code, :card_pin, :amount, presence: true
validates :card_code, uniqueness: true

belongs_to :user

end
