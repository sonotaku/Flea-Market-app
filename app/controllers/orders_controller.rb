class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    parems.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :burden_id, :prefecture_id, :day_id, :price).merge(user: current_user.id)
  end
end
