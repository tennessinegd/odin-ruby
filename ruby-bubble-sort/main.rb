def bubble_sort(param)
  # prevent mutation of original array
  array = param.dup
  bubble = 0
  loop do
    offset = 0
    no_swaps = true
    # loop over every two consecutive elements in the array
    # skip over the last elements - they'll have "bubbled up" anyway
    until offset == array.length - 1 - bubble
      if array[offset] > array[offset + 1]
        # swap the elements if necessary
        no_swaps = false
        array[offset], array[offset + 1] = array[offset + 1], array[offset]
      end
      offset += 1
    end
    bubble += 1
    # we're done here, all sorted (pun intended)
    break if no_swaps
  end
  array
end

p bubble_sort([2,354,8623,8,2,41,2,156,3,54,817,35,256,6,32])