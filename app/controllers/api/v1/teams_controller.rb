# frozen_string_literal: true

module Api
  module V1
    # TeamsController
    class TeamsController < ApplicationController
      include Api

      def index
        @teams = user.company.teams

        render json: @teams, each_serializer: TeamSerializer
      end

      def show
        render json: team, serializer: TeamSerializer
      end

      def create
        @team = user.company.teams.build(team_params)

        if @team.save
          render json: @team, status: :created, location: api_v1_team_path(@team)
        else
          render json: @team.errors, status: :unprocessable_entity
        end
      end

      def edit; end

      def update
        if team.update(team_params)
          render json: team, status: :ok, location: api_v1_team_path(team)
        else
          render json: team.errors, status: :unprocessable_entity
        end
      end

      def destroy
        team.destroy
        head :no_content
      end

      private

      def team_params
        params.require(:team).permit(:name, :company_id)
      end

      def team
        @team ||= user.company.teams.find(params[:id])
      end
    end
  end
end
