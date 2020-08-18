class Address < ApplicationRecord
  belongs_to :item

  with_options presence: true do
    validates :postal_number, format: { with: /-/ }   # ハイフン必須
    validates :prefecture_id, numericality: { other_than: 0 }   # 0より大きいもの
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/}  # ハイフンなし、11文字以内
    validates :item
  end
  validates :building
end
