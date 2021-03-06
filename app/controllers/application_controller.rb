class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  end

  #ナビゲーションバーにタイトルを表示させるメソッド
  def set_page_name(page_name)
    @page = page_name
  end
end
