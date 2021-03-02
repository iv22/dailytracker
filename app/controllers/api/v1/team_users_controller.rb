# frozen_string_literal: true

module Api
  module V1
    # TeamUsersController
    class TeamUsersController < ApplicationController
      before_action :set_team_user, only: %i[show edit update destroy]

      def index
        @team_users = Team_user.all

        render json: @team_users, each_serializer: TeamUserSerializer
      end

      def show
        if @team_user
          render json: @team_user, serializer: TeamUserSerializer
        else
          render json: @team_user.errors
        end
      end

      def new
        @team_user = @team.build_team_user
      end

      def create
        @team_user = @team.build_team_user(team_user_params)

        if @team_user.save
          render json: @team_user, status: :ok, location: api_v1_team_user_path(@team_user)
        else
          render json: @team_user.errors, status: :unprocessable_entity
        end
      end

      def update
        if @team_user.update(team_user_params)
          render json: @team_user, status: :ok, location: api_v1_team_user_path(@team_user)
        else
          render json: @team_user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @team_user.destroy
        render json: :no_content
      end

      private

      def team_params
        params.require(:team_user).permit(:name, :team_id)
      end

      def company
        @company ||= Company.find_by(params[:company_id])
      end

      def team
        @team ||= company.teams.find_by(params[:team_id])
      end

      def set_team_user
        @team_user = team.team_user
      end
    end
  end
end