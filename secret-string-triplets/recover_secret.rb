def recover_secret(sequences)
  secret = ''
  secret << extract_next_char(sequences) until sequences.empty?
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
