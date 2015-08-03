def befuddle(text)
  return '' if text.nil? || text.strip.empty?
  transform_sequence = [:reverse, :upcase, :chop, :capitalize, :length, :downcase, :clear, :to_s].cycle
  sentences = text.strip.split '.'
  befuddled_sentences = sentences.map do |sentence|
    words = sentence.split
    befuddled_words = words.map do |word|
      word.send(transform_sequence.next)
    end
    transform_sequence.rewind
    befuddled_sentence = "#{befuddled_words.join(' ').squeeze(' ')}."
  end
  befuddled_sentences.join ' '
end
