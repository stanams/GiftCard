class RedemptionCard < ActiveRecord::Base

  validates :card_code, :card_pin, presence: true
  validates :card_code, uniqueness: true
  validates :card_code, length: { is: 16 }
  validates :card_pin, length: { is: 4 }


  belongs_to :user


  def self.find_by_card_codes(card_code, card_pin)
    @redemption_card = RedemptionCard.find_by(card_code: card_code)
    return nil unless @redemption_card && @redemption_card.is_pin?(card_pin)
    @redemption_card
  end

  def is_pin?(card_pin)
    # Hard coded value for card_pin
    if card_pin != 1111
      flash.now[:errors] = ["Wrong pin! Double check your pin on your gift card."]
    end
  end

end
