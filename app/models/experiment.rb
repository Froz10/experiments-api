# frozen_string_literal: true

require 'distribution'

class Experiment < ApplicationRecord
  validates :token, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :button_color, presence: true
  validates :price, presence: true

  def self.color
    @color ||= Color.new
  end

  def self.price
    @price ||= Price.new
  end

  def self.color_distribution
    @color.next_value
  end

  def self.price_distribution
    @price.next_value
  end
end
