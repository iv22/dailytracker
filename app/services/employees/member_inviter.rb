# frozen_string_literal: true

module Employees
  class MemberInviter < ApplicationService
    attr_reader :params

    def initialize(params)
      super()
      @params = params
    end

    def call
      User.invite!(params)
    end
  end
end
