# frozen_string_literal: true

module Api
  class ExperimentService < ApplicationService
    def initialize(token) # rubocop:disable Lint/MissingSuper: Call super to initialize state of the parent class.
      @token = token
    end

    def call
      default_values
      attribute_color if query_to_db_valid?
      attribute_price if query_to_db_valid?
      experiment_params
      @experiment = Experiment.create experiment_params
      @experiments = Experiment.select(:button_color, :price).where(token: @token)
    end

    private

    def default_values
      Experiment.colors
      Experiment.prices
    end

    def attribute_color
      @button_color = Experiment.color
    end

    def attribute_price
      @price = Experiment.price
    end

    def query_to_db_valid?
      !Experiment.exists?(token: @token)
    end

    def experiment_params
      @params = { token: @token, button_color: @button_color, price: @price }
    end
  end
end
