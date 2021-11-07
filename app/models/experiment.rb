# frozen_string_literal: true

require 'distribution'
##
# This class represents the entity Experiment model.
class Experiment < ApplicationRecord
  validates :token, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :button_color, presence: true
  validates :price, presence: true

  # Creates a new service instance Color.
  def self.color
    @color ||= Color.new
  end

  # Creates a new service instance Price.
  def self.price
    @price ||= Price.new
  end

  # Creates a new distribution for Color.
  def self.color_distribution
    @color.next_value
  end

  # Creates a new distribution for Price.
  def self.price_distribution
    @price.next_value
  end
end
