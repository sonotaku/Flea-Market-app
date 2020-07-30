class ApplicationController < ActionController::Base
  before_action :basic_auth

  private
     #  basic認証の設定
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_FURIMA_USER"] && password == ENV["BASIC_FURIMA_PASSWORD"]
    end
  end
end