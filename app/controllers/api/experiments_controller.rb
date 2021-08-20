class Api::ExperimentsController < ApplicationController
  before_action :get_header, only: [:index]
  before_action :set_default_values, only: [:index]
  before_action :set_button_color, only: [:index], unless: :query_validation_to_db?, if: :query_validation_token?
  before_action :set_product_price, only: [:index], unless: :query_validation_to_db?, if: :query_validation_token?
  before_action :experiment_params, only: [:index]
  before_action :create, only: [:index]


  def index
    if query_validation_token?
      render json: {
                      "experiments": [
                        {
                          "value": Experiment.select(:button_color)
                          .where(token: @token)
                          .pluck(:button_color)[0],
                          "key": "button_color",
                        },
                        {
                          "value": Experiment.select(:price)
                          .where(token: @token)
                          .pluck(:price)[0],
                          "key": "price",
                        },
                      ]
                    }
      else
        render json: {}, status: :forbidden
      end
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

  def query_validation_to_db?
    @query_to_db = Experiment.select(:token).pluck(:token)
    @query_to_db.include? @token
  end

  def query_validation_token?
    request.headers.key? "Device-Token"
  end

  def experiment_params
    @params = {:token => @token, :button_color => @button_color, :price => @price }
  end

end