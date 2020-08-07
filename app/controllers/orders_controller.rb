class OrdersController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
      # @item.image.new
    else
      redirect_to root_path
    end
  end

  def create
    if  params[:item_image].present?
      @item = Item.new(item_params)
      respond_to do |format|
        format.html
        format.json {render json: @item}
      end
      if @item.save
        # 複数画像が入ったハッシュ形式からひとつずつ取り出して保存
        params[:item_image][:image].each do |image|
          @item.item_image.create(image: image)
        end
        redirect_to item_path(@item)
      else
        redirect_to new_order_path
      end
    else
      redirect_to new_order_path
    end
  end
  
  # def create
  #   @item = Item.new(item_params)
  #   if @item.save
  #     redirect_to root_path
  #   else
  #     render action: :new
  #   end
  # end

  private
  
  def item_params
    params.require(:item).permit(
      :image, 
      :name, 
      :description, 
      :category_id, 
      :condition_id, 
      :burden_id, 
      :prefecture_id, 
      :day_id, 
      :price).merge(user: current_user.id)
  end
end
