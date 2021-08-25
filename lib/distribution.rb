# frozen_string_literal: true

class Color
  def initialize
    @colors = []
  end

  def distribution
    @colors = %w[#FF0000 #00FF00 #0000FF] if @colors.empty?
    @colors.shift
  end
end

class Price
  def initialize
    @probability = [0.75, 0.1, 0.1, 0.05]
    @prices = []
    @counter = 0
  end

  def distribution
    @counter += 1
    price1 = (@counter * @probability[0]).round
    price2 = (@counter * @probability[1]).round
    price3 = (@counter * @probability[2]).round
    price4 = (@counter * @probability[3]).round
    @prices << calculation_price(price1, price2, price3, price4)
    @prices.last
  end

  def calculation_price(price1, price2, price3, price4)
    if @prices.count('10') < price1 then '10'
    elsif @prices.count('20') < price2 then '20'
    elsif @prices.count('5') < price3 then '5'
    elsif @prices.count('50') < price4 then '50'
    # rubocop:disable Lint/DuplicateBranch: Duplicate branch body detected.
    else '10' # This is necessary logic
      # rubocop:enable Lint/DuplicateBranch: Duplicate branch body detected.
    end
  end
end
