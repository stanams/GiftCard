class RedemptionCardsController < ApplicationController

  def new

    @redemption_card = RedemptionCard.new(user_id: current_user.id)
  end

  def index
    @redemption_cards = RedemptionCard.all
  end

  def create
    @redemption_card = RedemptionCard.create(redemption_card_params)

    # @redemption_card = RedemptionCard.find_by_card_codes(
    #   params[:redemption_card][:card_code],
    #   params[:redemption_card][:card_pin]
    # )
    @current_user_balance = current_user.balance
    @current_user_balance += 20
    if (params[:redemption_card][:card_code].to_s.include?("symphonycrocks")) &&
      (params[:redemption_card][:card_pin] == "1234")


      redirect_to redemption_card_url(@redemption_card.id)
      flash.now[:success] = ["Congrats! You've redeemed your Card Gift!"]
    elsif (params[:redemption_card][:card_code] == "") && (params[:redemption_card][:card_pin] == "")
      flash.now[:errors] = ["You didn't enter your card & pin codes!"]
      render :new
    elsif (params[:redemption_card][:card_code] == "")
      flash.now[:errors] = ["You didn't enter a card code!"]
      render :new
    elsif (params[:redemption_card][:card_pin] == "")
      flash.now[:errors] = ["You didn't enter a pin code!"]
      render :new
    else
      flash.now[:errors] = ["Wrong code & pin combination!."]
      flash.now[:errors] += ["Please retry or contact our support."]
      render :new
    end
  end

  def show
    current_user.balance += 20
    @redemption_card = RedemptionCard.find(params[:id])
  end

  private
  def redemption_card_params
    params.require(:redemption_card).permit(:card_code, :card_pin, :amount)
  end

end
