# frozen_string_literal: true

# Start page controller
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
