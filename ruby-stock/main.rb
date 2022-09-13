# take array of stock prices
# whenever there's a new highest price just sell there instead (more profit)
# whenever there's a new lowest price, check for the next highest price - and compare the profit.
  # if it's worth it, buy there instead; if not, use the previous buy value

def stock_picker(prices)
  lowest = prices[0]
  lowest_index = 0
  profit = 0
  indices = [0, 0]
  prices.each_with_index do |price, i|
    if price < lowest
      lowest = price
      lowest_index = i
      next
    end
    if price - lowest > profit
      profit = price - lowest
      indices = [lowest_index, i]
    end
  end
  indices
end


p stock_picker([17,3,6,9,15,8,6,1,10])
# obligatory stonks joke