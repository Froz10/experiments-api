# frozen_string_literal: true
##
# This is general module API.
module Api
  # This class represents business logic service.
  # Creates a new service instance.
  class ExperimentService < ApplicationService
    # initialize service object
    def initialize(token) # rubocop:disable Lint/MissingSuper: Call super to initialize state of the parent class.
      @token = token
    end
    # Calls the service that starts generating the experiment
    # A distribution is generated for color and price if the database is a valid token
    def call
      start_experiment
      generate_color if query_to_db_valid?
      generate_price if query_to_db_valid?
      Experiment.create experiment_params
      Experiment.select(:button_color, :price).where(token: @token)
    end

    private

    def start_experiment
      Experiment.color
      Experiment.price
    end

    def generate_color
      @button_color = Experiment.color_distribution
    end

    def generate_price
      @price = Experiment.price_distribution
    end

    def query_to_db_valid?
      !Experiment.exists?(token: @token)
    end

    def experiment_params
      @params = { token: @token, button_color: @button_color, price: @price }
    end
  end
end
