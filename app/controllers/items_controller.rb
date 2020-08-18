class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
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
  
  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    if item.save
      redirect_to item_path(item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

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

  def set_item
    @item = Item.find(params[:id])
  end
end