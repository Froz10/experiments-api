# frozen_string_literal: true

require 'rails_helper'
require './lib/distribution'

RSpec.describe 'Distribution' do
  let(:arr) { [] }
  let(:color) { Color.new }
  let(:price) { Price.new }

  context 'when GET from device' do
    it 'return distribution color' do
      distrib = color.distribution
      expect(distrib).not_to be_empty
    end

    it 'return distribution price' do
      distrib = price.distribution
      expect(distrib).not_to be_empty
    end
  end

  context 'when GET from device 20 times price' do
    it 'return distribution probability price 10' do
      20.times { arr << price.distribution }
      expect(arr.count('10')).to eq(15)
    end

    it 'return distribution probability price 20' do
      20.times { arr << price.distribution }
      expect(arr.count('20')).to eq(2)
    end

    it 'return distribution probability price 5' do
      20.times { arr << price.distribution }
      expect(arr.count('5')).to eq(2)
    end

    it 'return distribution probability price 50' do
      20.times { arr << price.distribution }
      expect(arr.count('50')).to eq(1)
    end
  end

  context 'when GET from device 20 times color' do
    it 'return distribution probability color #FF0000' do
      20.times { arr << color.distribution }
      expect(arr.count('#FF0000')).to eq(7)
    end

    it 'return distribution probability color #00FF00' do
      20.times { arr << color.distribution }
      expect(arr.count('#00FF00')).to eq(7)
    end

    it 'return distribution probability color #0000FF' do
      20.times { arr << color.distribution }
      expect(arr.count('#0000FF')).to eq(6)
    end
  end
end
