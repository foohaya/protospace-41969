class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :occupation, :position])
  end
end

# ログイン後のリダイレクト先
def after_sign_in_path_for(resource)
  root_path
end

# ログアウト後のリダイレクト先
def after_sign_out_path_for(resource_or_scope)
  root_path
end