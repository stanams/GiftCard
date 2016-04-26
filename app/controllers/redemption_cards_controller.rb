class RedemptionCardsController < ApplicationController

  def new
    @redemption_card = RedemptionCard.new
  end

  def index
    @redemption_cards = RedemptionCard.all
  end

  def create
    @redemption_card = RedemptionCard.find_by_card_codes(
      params[:redemption_card][:card_code],
      params[:redemption_card][:card_pin]
    )

    if (params[:redemption_card][:card_code].to_s == "1234567898765432") &&
      (params[:redemption_card][:card_pin] == 1234)


      redirect_to new_redemption_card_url
    else
      flash.now[:errors] = ["Wrong code & pin combination! Double check your card."]
      render :new
    end
  end

  def show
    @redemption_card = RedemptionCard.find(params[:id])
  end

  private
  def redemption_card_params
    params.require(:redemption_card).permit(:card_code, :card_pin, :amount)
  end

end
