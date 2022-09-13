# take array of stock prices
# whenever there's a new highest price just sell there instead (more profit)
# whenever there's a new lowest price, check for the next highest price - and compare the profit.
  # if it's worth it, buy there instead; if not, use the previous buy value

def stock_picker(prices)
  prices.reduce({best: [], lowest: [0, 0], indices: [], index: -1}) do |acc, price|
    # assign the hash array to a variable just for the sake of convenience
    acc[:index] += 1
    best = acc[:best]
    indices = acc[:indices]
    # skip first check
    if best.empty?
      best.push(price, price)
      indices.push(acc[:index], acc[:index])
      acc[:lowest][0] = price
      next acc
    end
    # start new comparison
    if price < acc[:lowest][0]
      acc[:lowest][0] = price
      acc[:lowest][1] = acc[:index]
      next acc
    end
    # check for profit and assign if it's better
    if price - acc[:lowest][0] > best[1] - best[0]
      best[0] = acc[:lowest][0]
      best[1] = price
      indices[0] = acc[:lowest][1]
      indices[1] = acc[:index]
    end
    acc
  end[:indices]
end


p stock_picker([17,3,6,9,15,8,6,1,10])
# obligatory stonks joke