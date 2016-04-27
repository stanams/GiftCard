class AddDefaultValueToAmount < ActiveRecord::Migration
  def change
    change_column :redemption_cards, :amount, :integer, default: [10, 20, 30, 40, 50].sample
  end
end
