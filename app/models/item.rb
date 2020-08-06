class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :descriptiom
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :burden_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :day_id, numericality: { other_than: 1 } 
    validates :price, :numericality => {
      :greater_than_or_equal_to => 300,
      :less_than_or_equal_to => 9999999}
    validates :user
  end
end
