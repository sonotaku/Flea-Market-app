class OrdersController < ApplicationController
  before_action :move_to_index, except: [:index]
  # before_action :authenticate_user!, only: :authentication

  def index
  end

  def new
    @user = User.new
  end

  def authentication
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
