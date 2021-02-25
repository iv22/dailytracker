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

      def index
        if manager?
          @members = @company.members
          render json: @members, each_serializer: UserSerializer
        else
          handle_unauthorized
        end
      end

      def show
        if @member.managed_by?(current_user)
          render_member
        else
          handle_unauthorized
        end
      end

      def current
        @member = current_user
        @member = @member.decorate
        render_member
      end

      def create
        if manager?
          create_employee
        else
          handle_unauthorized
        end
      end

      def update
        if @member.managed_by?(current_user)
          update_response
        else
          handle_unauthorized
        end
      end

      def destroy
        if @member.managed_by?(current_user)
          @member.destroy
          render json: {}, status: :no_content
        else
          handle_unauthorized
        end
      end

      # lock employee
      # get_by_role
      # upload_employees

      private

      def set_company
        @company = current_user.company_user.company.decorate
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

      def member_params
        params.require(:member).permit(:email, :first_name, :last_name, :role)
      end

      def manager?
        current_user.role == 'manager'
      end

      def render_member
        render json: @member, serializer: UserSerializer
      end

      def create_user_by_invitation
        ActiveRecord::Base.transaction do
          @member = User.invite!(member_params)
          @company.company_users.create!(user: @member)
        end
      end

      def create_employee
        create_user_by_invitation
      rescue ActiveRecord::RecordInvalid => e
        render json: e.errors, status: :unprocessable_entity
      else        
        render json: @member, status: :created, location: api_v1_employee_path(@member)
      end

      def update_response        
        if @member.update(member_params)
          render json: @member, status: :ok, location: api_v1_employee_path(@member)
        else
          render json: @member.errors, status: :unprocessable_entity
        end
      end
    end
  end
end