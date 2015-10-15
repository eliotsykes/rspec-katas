def justify(text, width)
  return unless text

  words = text.split
  assert_words_fit_width(words, width)

  lines = []
  space = " ".freeze

  until words.empty?
    line = words.shift

    while words.any? && line.length < width
      candidate_length = line.length + space.length + words.first.length

      if candidate_length > width
        line = pad(line, width)
      else
        line << space << words.shift
      end
    end
    lines << line
  end
  return lines.join "\n"
end

def assert_words_fit_width(words, width)
  max_word_length = words.max_by(&:length).length
  if max_word_length > width
    raise ArgumentError, "Longest word exceeds width"
  end
end

def pad(line, width)
  line.sub " ", "  "
end
