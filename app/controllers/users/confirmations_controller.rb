# frozen_string_literal: true

module Users
  # User registration confirmation is processed here
  class ConfirmationsController < Devise::ConfirmationsController
    # GET /resource/confirmation/new
    # def new
    #   super
    # end

    # POST /resource/confirmation
    # def create
    #   super
    # end

    # GET /resource/confirmation?confirmation_token=abcdef
    # def show
    #   super
    # end

    protected

    # The path used after resending confirmation instructions.
    # def after_resending_confirmation_instructions_path_for(resource_name)
    #   super(resource_name)
    # end

    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      begin
        create_new_user_company(resource) if resource.company_user.nil?
      rescue StandardError
        flash['set_company_error'] = 'Company registration error!'
      end
      super(resource_name, resource)
    end

    private

    def create_new_user_company(user)
      ActiveRecord::Base.transaction do
        company = Company.create(name: 'New company')
        company.company_users.create(user: user)
      end
    end
  end
end
