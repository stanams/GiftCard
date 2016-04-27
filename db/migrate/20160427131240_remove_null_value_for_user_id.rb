class RemoveNullValueForUserId < ActiveRecord::Migration
  def change
    change_column :redemption_cards, :user_id, :integer, null: true
  end
end
