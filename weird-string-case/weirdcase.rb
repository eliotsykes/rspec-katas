def weirdcase(text)
  transform_sequence = [:upcase, :downcase].cycle

  weird_words = text.split.map do |word|
    weird_chars = word.chars.map { |char| char.send(transform_sequence.next) }
    transform_sequence.rewind
    weird_chars.join
  end

  weird_words.join ' '
end
