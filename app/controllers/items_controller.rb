class ItemsController < ApplicationController

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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def calculate
  #   item = Item.price.find(params(:id))
  #   item.update
  #   price = Item.price(params[:id])
  #   render json: { item: price }
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
      :price
      ).merge(user_id: current_user.id)
  end
end