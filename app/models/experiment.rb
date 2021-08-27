# frozen_string_literal: true

class Experiment < ApplicationRecord
  validates :token, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :button_color, presence: true
  validates :price, presence: true
end
