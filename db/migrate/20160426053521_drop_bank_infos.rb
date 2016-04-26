class DropBankInfos < ActiveRecord::Migration
  def change
    drop_table :bank_infos
  end
end
