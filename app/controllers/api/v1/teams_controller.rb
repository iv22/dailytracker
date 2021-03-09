# frozen_string_literal: true

module Api
  module V1
    # TeamsController
    class TeamsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_team, only: %i[show edit update destroy]

      def index
        @teams = user.company.teams

        render json: @teams, each_serializer: TeamSerializer
      end

      def show
        if @team
          render json: @team, serializer: TeamSerializer
        else
          render json: @team.errors
        end
      end

      def new
        @team = user.company.teams.build
      end

      def create
        @team = user.company.teams.build(team_params)

        if @team.save
          render json: @team, status: :ok, location: api_v1_team_path(@team)
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      def edit; end

      def update
        if @team.update(team_params)
          render json: @team, status: :ok, location: api_v1_team_path(@team)
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @team.destroy
        head :no_content
      end

      private

      def team_params
        params.require(:team).permit(:name, :company_id)
      end

      def user
        @user ||= User.find_by(params[:user_id]).decorate
      end

      def company
        @company ||= current_user.company_user&.company&.decorate
      end

      def set_team
        @team = user.company.teams.find(params[:id])
      end
    end
  end
end
