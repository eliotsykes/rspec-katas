def recover_secret(triplets)
  secret = ''
  until triplets.empty?
    next_char_candidates = triplets.map(&:first)
    next_char = next_char_candidates.find do |next_char_candidate|
      triplets.all? { |triplet| [0, nil].include? triplet.index(next_char_candidate) }
    end
    triplets.each { |triplet| triplet.delete(next_char) }
    triplets.delete []
    secret << next_char
  end
  secret
end
