# frozen_string_literal: true

require 'distribution'

class Experiment < ApplicationRecord
  validates :token, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :button_color, presence: true
  validates :price, presence: true

  def self.colors
    @colors ||= Color.new
  end

  def self.prices
    @prices ||= Price.new
  end

  def self.color
    @colors.distribution
  end

  def self.price
    @prices.distribution
  end
end
