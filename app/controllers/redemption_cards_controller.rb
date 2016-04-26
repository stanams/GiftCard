class RedemptionCardsController < ApplicationController

  # def new
  #   @redemption_card = RedemptionCard.new
  # end
  #
  # def create
  #   @redemption_card = RedemptionCard.new(redemption_card_params)
  #
  #   if @redemption_card.save
  #
  #     redirect_to root_url
  #   else
  #     flash.now[:errors] = @redemption_card.errors.full_messages
  #     render :new
  #   end
  # end

  def show
    @redemption_card = RedemptionCard.find(params[:id])
  end

  private
  def redemption_card_params
    params.require(:redemption_card).permit(:card_code, :card_pin, :amount)
  end

end
