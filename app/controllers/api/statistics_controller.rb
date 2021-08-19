class Api::StatisticsController < ApplicationController
  def index
    @statistics = Experiment.all
    render json: @statistics
  end
end
