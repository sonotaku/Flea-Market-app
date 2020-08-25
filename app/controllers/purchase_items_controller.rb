class PurchaseItemsController < ApplicationController

    # 購入確認画面表示
  def index
    @item = Item.find_by(id: params[:item_id])
  end

    # 購入
  def create
    @purchase = ItemPurchase.new(purchase_params)
      # エラーの有無で判断
    if @purchase.valid?
      pay_item  # 支払処理
      @purchase.save

      @item_buyer = Item.find_by(id: params[:item_id])
      @item_buyer.update(buyer_id: current_user.id)

      return redirect_to root_path
    else
      redirect_to  item_purchase_items_path
    end
  end

  private

  def purchase_params
    params.permit(
      :item_id,
      :token,
      :postal_number,
      :prefecture_id,
      :city,
      :address,
      :building,
      :phone
    ).merge(user_id: current_user.id)
  end

    # 支払機能
    def pay_item
      @item = Item.find_by(id: params[:item_id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency:'jpy'                 # 通貨の種類
      )
    end
end
