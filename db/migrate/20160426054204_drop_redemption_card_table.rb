class DropRedemptionCardTable < ActiveRecord::Migration
  def change
    drop_table :redemption_cards
  end
end
