# frozen_string_literal: true

module Api
  class ExperimentsController < ApplicationController
    before_action :validate_header!

    def index
      @experiment = Api::ExperimentService.call(device_header)
    end

    private

    def validate_header!
      render(json: {}, status: :forbidden) unless device_header
    end

    def device_header
      @device_header ||= request.headers['Device-Token']
    end
  end
end
