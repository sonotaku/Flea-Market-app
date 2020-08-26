class RemovePurchaserIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :purchaser_id, :integer
  end
end
