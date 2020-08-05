class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @user = User.new
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
