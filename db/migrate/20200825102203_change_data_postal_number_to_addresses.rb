class ChangeDataPostalNumberToAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :postal_number, :string
  end
end
