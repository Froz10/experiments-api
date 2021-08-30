# frozen_string_literal: true

module Api
  class ExperimentService < ApplicationService
    def initialize(token) # rubocop:disable Lint/MissingSuper: Call super to initialize state of the parent class.
      @token = token
    end

    def call
      default_initialize
      generate_color if query_to_db_valid?
      generate_price if query_to_db_valid?
      Experiment.create experiment_params
      Experiment.select(:button_color, :price).where(token: @token)
    end

    private

    def default_initialize
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
