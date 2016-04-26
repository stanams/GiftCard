class CreateRedemptionCards < ActiveRecord::Migration
  def change
    create_table :redemption_cards do |t|

      t.string :card_code, null: false
      t.integer :card_pin, null: false
      t.integer :amount, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
