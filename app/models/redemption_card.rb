class RedemptionCard < ActiveRecord::Base

  validates :card_code, :card_pin, :amount, presence: true
  validates :card_code, uniqueness: true
  validates :card_code, length: { is: 16 }
  validates :card_pin, length: { is: 4 }


  belongs_to :user

end
