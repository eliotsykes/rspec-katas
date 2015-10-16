def justify(text, width)
  return unless text && !text.empty?

  line_regex = /(?<=\s|\A).{1,#{width}}(?=\s|\z)/

  justified_text = text.
    scan(line_regex).
    map { |line| justify_line(line, width) }.
    join("\n")

  raise "Text cannot be justified to width #{width} without splitting words" if justified_text.empty?

  return justified_text
end

def justify_line(line, width)
  words = line.split

  return line if words.size == 1

  width_met = (line.length == width)
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
