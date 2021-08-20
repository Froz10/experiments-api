# frozen_string_literal: true

module Api
  class StatisticsController < ApplicationController
    def index
      @statistics = Experiment.all
      render json: @statistics
    end
  end
end
