# frozen_string_literal: true

# It is root for all Application Controllers
class ApplicationController < ActionController::Base
  prepend_view_path Rails.root.join('frontend')

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_active_admin_user!
    authenticate_user!
    return if current_user.role == 'admin'

    flash[:alert] = 'Unauthorized Access!'
    redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name role])
  end
end
