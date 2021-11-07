# frozen_string_literal: true
##
# This is general module API.
module Api
  ##
  # This class represents the statistics of experiments.
  class StatisticsController < ApplicationController

    # GET /statistics
    def index
      @statistics = Experiment.all
      render json: @statistics
    end
  end
end
