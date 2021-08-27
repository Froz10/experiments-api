# frozen_string_literal: true

require 'distribution'

module Api
  class ExperimentService < ApplicationService
    attr_reader :token, :color_distribution, :price_distribution

    def initialize(token) # rubocop:disable Lint/MissingSuper: Call super to initialize state of the parent class.
      @token = token
      @color_distribution = Distribution::Color.new
      @price_distribution = Distribution::Price.new
    end

    def call
      Experiment.find_or_create_by(token: token) do |experiment|
        experiment.button_color = color_distribution.next_value
        experiment.price = price_distribution.next_value
      end
    end
  end
end
