# frozen_string_literal: true

module Api
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActionPolicy::Unauthorized, with: :handle_unauthorized
    rescue_from ArgumentError, with: :params_invalid
  end

  private

  def company
    @company ||= current_user.company_user&.company&.decorate
  end

  def member
    @member ||= User.find(params[:id]).decorate
  end

  def params_invalid(error)
    render json: { error: error.message }, status: :unprocessable_entity
  end

  def user
    @user ||= User.find_by(params[:user_id]).decorate
  end
end
