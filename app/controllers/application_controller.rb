class ApplicationController < ActionController::Base
  before_action :basic_selfy
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_selfy
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_SELFY_USER"] && password == ENV["BASIC_SELFY_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :nickname, :name, :birthday, :phone])
  end

end
