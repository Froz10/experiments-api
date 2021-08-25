# frozen_string_literal: true

module Api
  class ExperimentsController < ApplicationController
    before_action :device_header

    def index
      if token_valid?
        @experiments = Api::ExperimentService.call(@token)
      else
        render json: {}, status: :forbidden
      end
    end

    private

    def device_header
      @token = request.headers['Device-Token']
    end

    def token_valid?
      request.headers.key? 'Device-Token'
    end
  end
end
