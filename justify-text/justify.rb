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
  width_met = line.length == width
  shortest_whitespace_length = 0

  until width_met
    shortest_whitespace_length += 1
    shortest_whitespace_regex = %r{(?<=\S)\s{#{shortest_whitespace_length}}(?=\S)}
    longer_whitespace = " " * (shortest_whitespace_length+1)

    while !width_met && line =~ shortest_whitespace_regex
      line.sub! shortest_whitespace_regex, longer_whitespace
      width_met = line.length == width
    end
  end

  line
end
