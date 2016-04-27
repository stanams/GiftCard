class AddUsedColumnToCards < ActiveRecord::Migration
  def change
    add_column :redemption_cards, :used_at, :datetime
  end
end
