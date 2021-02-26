# frozen_string_literal: true

module Api
  module V1
    # Employees API controller
    class EmployeesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_company
      before_action :set_member, only: %i[show update destroy]
      before_action :validate_role, only: %i[create update]
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
      rescue_from ActionPolicy::Unauthorized, with: :handle_unauthorized

      def index
        authorize! Object, with: UserPolicy
        @members = @company.members
        render json: @members, each_serializer: UserSerializer
      end

      def show
        authorize! @member, with: UserPolicy
        render json: @member, serializer: UserSerializer
      end

      def create
        authorize! Object, with: UserPolicy
        @member = UserInviter.call(member_params, @company)
        render json: @member, status: :created, location: api_v1_employee_path(@member)
      end

      def update
        authorize! @member, with: UserPolicy
        if @member.update(member_params)
          render json: @member, status: :ok, location: api_v1_employee_path(@member)
        else
          render json: @member.errors, status: :unprocessable_entity
        end
      end

      def destroy
        authorize! @member, with: UserPolicy
        @member.destroy
        render json: {}, status: :no_content
      end

      # lock employee
      # upload_employees

      private

      def set_company
        @company = current_user.company_user&.company&.decorate
      end

      def set_member
        @member = User.find(params[:id]).decorate
      end

      def validate_role
        role = params.require(:member)[:role]
        return if %w[manager employee].include? role

        render json: { error: "Invalid Role: #{role}" }, status: :unprocessable_entity
      end

      def handle_unauthorized
        error_message = 'You are not authorized to perform this action.'
        render json: { error: error_message }, status: :unauthorized
      end

      def record_not_found(error)
        render json: { error: error.message }, status: :not_found
      end

      def record_invalid(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end

      def member_params
        params.require(:member).permit(:email, :first_name, :last_name, :role)
      end
    end
  end
end
