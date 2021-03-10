# frozen_string_literal: true

module Api
  module V1
    # Employees API controller
    class EmployeesController < ApplicationController
      before_action :authenticate_user!
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
      rescue_from ActionPolicy::Unauthorized, with: :handle_unauthorized
      rescue_from ArgumentError, with: :params_invalid

      def index
        authorize! Object, with: Employees::UserPolicy
        @members = company.members
        render json: @members, each_serializer: UserSerializer
      end

      def show
        authorize! member, with: Employees::UserPolicy
        render json: member, serializer: UserSerializer
      end

      def create
        authorize! Object, with: Employees::UserPolicy
        invited_member = Employees::MemberCreator.call(member_params, company)
        render json: invited_member, status: :created, location: api_v1_employee_path(invited_member)
      end

      def update
        authorize! member, with: Employees::UserPolicy
        if member.update(member_params)
          render json: member, status: :ok, location: api_v1_employee_path(member)
        else
          render json: member.errors, status: :unprocessable_entity
        end
      end

      def destroy
        authorize! member, with: Employees::UserPolicy
        member.destroy
        respond_to { |format| format.json { head :no_content } }
      end

      def upload
        authorize! Object, with: Employees::UserPolicy
        attachment = params[:employees]
        if attachment.blank?
          respond_to { |format| format.json { head :no_content } }
        else
          Employees::CsvParser.call(attachment, company)
          render json: { message: I18n.t('employees.upload') }, status: :created
        end
      end

      private

      def company
        @company ||= current_user.company_user&.company&.decorate
      end

      def member
        @member ||= User.find(params[:id]).decorate
      end

      def member_params
        @member_params ||= Employees::MemberParams.call(params)
      end

      def params_invalid(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end
    end
  end
end
