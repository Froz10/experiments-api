class Color
  def initialize
    @color = []
  end
      
  def сolor_distribution
    @color = %W[#FF0000 #00FF00 #0000FF] if @color.empty?
    @color.shift
  end
end

class Price
  def initialize
    @price =  %W[10 20 5 50]
    @counter = 0
  end

  def price_distribution
    @counter += 1
    @counter = 1 if @counter > 10
    case @counter
    when 1..5
      @price[0]
    when 5..8
      @price[1]
    when 8..9
      @price[2]
    when 9..10
      @price[3]
    end
  end
end