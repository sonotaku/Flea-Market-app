class AddBuyerIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :buyer_id, :integer
  end
end
