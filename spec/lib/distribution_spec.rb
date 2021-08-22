# frozen_string_literal: true

require 'rails_helper'
require './lib/distribution'

RSpec.describe 'Distribution' do
  it 'return distribution color' do
    color = Color.new
    distribution = color.сolor_distribution
    expect(distribution).not_to be_empty
  end

  it 'return distribution price' do
    price = Price.new
    distribution = price.price_distribution
    expect(distribution).not_to be_empty
  end
end
