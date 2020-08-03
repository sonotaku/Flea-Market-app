class ApplicationController < ActionController::Base
  before_action :basic_auth

  # 他のカラムをDBに保存できるように設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected  # 自分のクラス内、もしくはその継承先でアクセス可能

  # devise_parameter_sanitizerメソッドはdeviseでユーザー登録をする場合に使用でき、「特定のカラムを許容する」メソッド
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sigh_up, keys: [:nickname, :family_name, :first_name, :flat_family_name, :flat_first_name, :birthday])
  end

  private # 自分のクラス内のみアクセス可能、継承先ではできない

  #  basic認証の設定
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

 
end
