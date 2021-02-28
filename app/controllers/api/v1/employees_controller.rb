# frozen_string_literal: true

module Api
  module V1
    # Employees API controller
    class EmployeesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_company
      before_action :set_member, only: %i[show update destroy]
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
      rescue_from ActionPolicy::Unauthorized, with: :handle_unauthorized
      rescue_from ArgumentError, with: :params_invalid

      def index
        authorize! Object, with: Employees::UserPolicy
        @members = @company.members
        render json: @members, each_serializer: UserSerializer
      end

      def show
        authorize! @member, with: Employees::UserPolicy
        render json: @member, serializer: UserSerializer
      end

      def create
        authorize! Object, with: Employees::UserPolicy
        Build::MemberInviter.call(member_params, @company)
        @member = User.find_by(email: member_params[:email])
        render json: @member, status: :created, location: api_v1_employee_path(@member)
      end

      def update
        authorize! @member, with: Employees::UserPolicy
        if @member.update(member_params)
          render json: @member, status: :ok, location: api_v1_employee_path(@member)
        else
          render json: @member.errors, status: :unprocessable_entity
        end
      end

      def destroy
        authorize! @member, with: Employees::UserPolicy
        @member.destroy
        respond_to { |format| format.json { head :no_content } }
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

      def params_invalid(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end

      def member_params
        @member_params ||= Build::MemberParams.call(params)
      end
    end
  end
end
