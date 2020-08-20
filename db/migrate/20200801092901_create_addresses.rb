class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_number, null: false
      t.integer :prefecture_id, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone, null: false
      t.user :references, null: false, foreign_key: true
      t.timestamps
    end
  end
end
