require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe "商品の購入" do
    context "商品を購入できる場合" do
      it "全ての項目に正確に入力したら購入できる" do
        expect(@item_purchase).to be_valid
      end
      it "building以外入力したら購入できる" do
        @item_purchase.building = ""
        expect(@item_purchase).to be_valid
      end
    end

    context "商品の購入ができない場合" do
      it "郵便番号がないと購入できない" do
        @item_purchase.postal_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal number is invalid")
      end
      it "郵便番号にハイフンがないと購入できない" do
        @item_purchase.postal_number = "1234567"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal number is invalid")
      end
      it "郵便番号にハイフンがあっても7桁以外だと購入できない" do
        @item_purchase.postal_number = "1234-5678"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal number is invalid")
      end
      it "都道府県がない（id=0）と購入できない" do
        @item_purchase.prefecture_id = "0"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "市区町村がないと購入できない" do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end
      it "番地がないと購入できない" do
        @item_purchase.address = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号がないと購入できない" do
        @item_purchase.phone = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone is invalid")
      end
      it "電話番号にハイフンがあると購入できない" do
        @item_purchase.phone = "123-4567-8912"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone is invalid")
      end
      it "電話番号が12文字以上だと購入できない" do
        @item_purchase.phone = "123456789123"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end
