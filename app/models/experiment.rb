require 'distribution'

class Experiment < ApplicationRecord
  validates :token, uniqueness: true, presence: true
  validates :button_color, presence: true
  validates :price, presence: true

  def self.default_values
    @color ||= Color.new
    @price ||= Price.new
  end

  def self.set_color
    @color.сolor_distribution
  end

  def self.set_price
    @price.price_distribution
  end

end
