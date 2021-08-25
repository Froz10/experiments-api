# frozen_string_literal: true

module Api
  class ExperimentsController < ApplicationController
    before_action :device_header, only: [:index]
    before_action :default_values, only: [:index]
    before_action :attribute_color, only: [:index], unless: :query_validation_to_db?, if: :query_validation_token?
    before_action :attribute_price, only: [:index], unless: :query_validation_to_db?, if: :query_validation_token?
    before_action :experiment_params, only: [:index]
    before_action :create, only: [:index]

    def index
      if query_validation_token?
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

    def query_validation_to_db?
      @query_to_db = Experiment.select(:token).pluck(:token)
      @query_to_db.include? @token
    end

    def query_validation_token?
      request.headers.key? 'Device-Token'
    end

    def experiment_params
      @params = { token: @token, button_color: @button_color, price: @price }
    end
  end
end
