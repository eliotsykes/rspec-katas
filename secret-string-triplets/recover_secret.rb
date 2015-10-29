def recover_secret(sequences)
  secret = ''
  secret << extract_next_char(sequences) until sequences.empty?
  secret
end

def extract_next_char(sequences)
  candidates = sequences.map(&:first).uniq
  next_char = candidates.find do |candidate|
    sequences.all? { |sequence| sequence.index(candidate).to_i.zero? }
  end
  sequences.each { |sequence| sequence.delete(next_char) }
  sequences.delete_if &:empty?
  next_char
end
