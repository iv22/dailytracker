# frozen_string_literal: true

module Api
  module V1
    # Employees API controller
    class EmployeesController < ApplicationController
      include Api

      def index
        authorize! Object, with: Employees::UserPolicy
        @members = company.members.map(&:decorate)
        render json: @members, each_serializer: UserSerializer
      end

      def show
        authorize! member, with: Employees::UserPolicy
        render json: member, serializer: UserSerializer
      end

      def create
        authorize! Object, with: Employees::UserPolicy
        invited_member = Employees::MemberCreator.call(member_params, company).decorate
        render json: invited_member, serializer: UserSerializer, status: :created,
               location: api_v1_employee_path(invited_member)
      end

      def update
        authorize! member, with: Employees::UserPolicy
        if member.update(member_params)
          render json: member, serializer: UserSerializer, status: :ok, location: api_v1_employee_path(member)
        else
          render json: member.errors, status: :unprocessable_entity
        end
      end

      def destroy
        authorize! member, with: Employees::UserPolicy
        member.destroy
        no_content_response
      end

      def upload
        authorize! Object, with: Employees::UserPolicy
        attachment = params[:employees]
        if attachment.blank?
          no_content_response
        else
          answer = Employees::UploadingAssistant.call(attachment, company)
          render json: { message: answer[:message] }, status: answer[:status]
        end
      end

      def lock
        authorize! member, with: Employees::UserPolicy

        if access_locked?
          render json: { message: I18n.t('employees.lock.locked_status') }, status: :not_acceptable
        else
          member.lock_access!({ send_instructions: false })
          render json: { message: I18n.t('employees.unlock.success') }, status: :ok
        end
      end

      def unlock
        authorize! member, with: Employees::UserPolicy

        if access_locked?
          member.unlock_access!
          render json: { message: I18n.t('employees.unlock.success') }, status: :ok
        else
          render json: { message: I18n.t('employees.unlock.active_status') }, status: :not_acceptable
        end
      end

      private

      def member_params
        @member_params ||= Employees::MemberParams.call(params)
      end
    end
  end
end
