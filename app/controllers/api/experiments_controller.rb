# frozen_string_literal: true
##
# This is general module API.
module Api
  ##
  # This class represents the processing of experiments using a specially designed service.
  class ExperimentsController < ApplicationController
    before_action :validate_header!

    # GET /experiments
    def index
      @experiment = Api::ExperimentService.call(device_header)
    end

    private

    # This method checks the headers and if it is not there it gives a 404 error.
    def validate_header!
      render(json: {}, status: :forbidden) unless device_header
    end

    # This method saves the header of the client request.
    def device_header
      @device_header ||= request.headers['Device-Token']
    end
  end
end
