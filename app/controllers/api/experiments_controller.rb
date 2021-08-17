class Api::ExperimentsController < ApplicationController
  before_action :get_header, only: [:index]
  before_action :set_default_values, only: [:index]
  before_action :set_button_color, only: [:index]
  before_action :set_product_price, only: [:index]
  before_action :experiment_params, only: [:index]
  before_action :create, only: [:index]


  def index
    render json: @experiment
  end

  def create
    @experiment = Experiment.create experiment_params
  end

  private

  def get_header
    @token = request.headers["Device-Token"]
  end

  def set_default_values
    Experiment.default_values
  end

  def set_button_color
    @button_color = Experiment.set_color
  end

  def set_product_price
    @price = Experiment.set_price
  end

  def experiment_params
    @params = {:token => @token, :button_color => @button_color, :price => @price }
  end

end