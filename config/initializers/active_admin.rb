# frozen_string_literal: true

ActiveAdmin.setup do |config|
  
  config.site_title = 'Dailytracker'

  config.authentication_method = :authenticate_active_admin_user!
  
  config.current_user_method = :current_user
  
  config.logout_link_path = :destroy_user_session_path

  config.logout_link_method = :delete
  
  config.batch_actions = true

  config.filter_attributes = %i[encrypted_password password password_confirmation]

  config.localize_format = :long

  config.use_webpacker = true
end
