class ItemPurchase

  include ActiveModel::Model
  attr_accessor :token, :postal_number, :prefecture_id, :city, :address, :building, :phone, :purchase_item_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_number, format: { with: /\A\d{3}[-]\d{4}\z/ }   # ハイフン必須かつ7桁
    validates :prefecture_id, numericality: { other_than: 0 }   # 0より大きいもの
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{11}\z/}  # ハイフンなし、11文字以内
  end

  def save
    purchase_item = PurchaseItem.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(
      postal_number: postal_number, 
      prefecture_id: prefecture_id, 
      city: city, 
      address: address, 
      building: building, 
      phone: phone, 
      purchase_item_id: purchase_item.id)
  end
end