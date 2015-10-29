def recover_secret(sequences)
  secret = ''
  until sequences.empty?
    secret << extract_next_char(sequences)
  end
  secret
end

def extract_next_char(sequences)
  candidates = sequences.map(&:first)
  next_char = candidates.find do |candidate|
    sequences.all? { |sequence| [0, nil].include?(sequence.index(candidate)) }
  end
  sequences.each { |sequence| sequence.delete(next_char) }
  sequences.delete []
  next_char
end
