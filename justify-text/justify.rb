def justify(text, width)
  return if text.nil? || text.empty?

  lines_to_pad = text.scan /(?<=\s|\A).{,#{width}}(?=\s|\z)/

  raise "Text cannot be justified to width #{width} without splitting words" if lines_to_pad.empty?

  return lines_to_pad.map { |line| pad(line, width) }.join("\n")
end

def pad(line, width)
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
