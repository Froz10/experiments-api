# frozen_string_literal: true

module Api
  class ExperimentsController < ApplicationController
    before_action :device_header, only: [:index]

    def index
      if query_token_valid?
        default_values
        attribute_color if query_to_db_valid?
        attribute_price if query_to_db_valid?
        experiment_params
        create
        @experiments = Experiment.select(:button_color, :price).where(token: @token)
      else
        render json: {}, status: :forbidden
      end
    end

    def create
      @experiment = Experiment.create experiment_params
    end

    private

    def device_header
      @token = request.headers['Device-Token']
    end

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

    def query_token_valid?
      request.headers.key? 'Device-Token'
    end

    def experiment_params
      @params = { token: @token, button_color: @button_color, price: @price }
    end
  end
end
