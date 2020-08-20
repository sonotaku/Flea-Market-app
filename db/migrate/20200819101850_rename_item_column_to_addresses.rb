class RenameItemColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :item_id, :user_id
  end
end
