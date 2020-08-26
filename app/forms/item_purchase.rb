class ItemPurchase

  include ActiveModel::Model
  attr_accessor :token, :postal_number, :prefecture_id, :city, :address, :building, :phone, :purchase_item_id, :user_id, :item_id

  with_options presence: true do
    POSTAL_NUMBER_REGEX = /\A\d{3}[-]\d{4}\z/.freeze  # ハイフン必須かつ7桁
    validates_format_of :postal_number, with: POSTAL_NUMBER_REGEX
    validates :prefecture_id, numericality: { other_than: 0 }   # 0より大きいもの
    validates :city
    validates :address
    PHONE_REGEX = /\A\d{11}\z/.freeze  # ハイフンなし、11文字以内
    validates_format_of :phone, with: PHONE_REGEX
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