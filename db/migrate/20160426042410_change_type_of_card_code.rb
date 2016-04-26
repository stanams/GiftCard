class ChangeTypeOfCardCode < ActiveRecord::Migration
  def change
    change_column :bank_infos, :card_code, :string
  end
end
