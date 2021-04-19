# frozen_string_literal: true

module Api
  module V1
    # TeamUsersController
    class TeamUsersController < ApplicationController
      include Api

      def index
        @team_users = team.team_users

        render json: @team_users, each_serializer: TeamUserSerializer
      end

      def show
        render json: team_user, serializer: TeamUserSerializer
      end

      def create
        @team_user = team.team_users.build(team_user_params)
        if @team_user.save
          render json: @team_user, status: :created, location: api_v1_team_team_users_path(@team_user)
        else
          render json: @team_user.errors, status: :unprocessable_entity
        end
      end

      def update
        if team_user.update(team_user_params)
          render json: team_user, status: :ok, location: api_v1_team_team_user_path(team_user)
        else
          render json: team_user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        team_user.destroy
        head :no_content
      end

      private

      def team_user_params
        params.require(:team_user).permit(:team_id, :user_id, :is_team_lead)
      end

      def team
        @team ||= Team.find(params[:team_id])
      end

      def team_user
        @team_user ||= team.team_users.find(params[:id])
      end
    end
  end
end
