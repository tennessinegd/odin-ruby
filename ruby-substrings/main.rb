def substrings(phrase, dictionary)
  phrase = phrase.downcase
  # create a new hash to operate on
  dictionary.reduce(Hash.new(0)) do |acc, sub|
    # start searching from the beginning
    search_index = 0
    # find all instances of the word, incrementing the hash key of the word each time
    loop do
      search_index = phrase.index(sub, search_index)
      break unless search_index
      search_index += 1
      acc[sub] += 1
    end
    acc
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("Howdy partner, sit down! How's it going?", dictionary)