class RemoveBuyerIdFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :buyer_id, :integer
  end
end
