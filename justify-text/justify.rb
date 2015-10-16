def justify(text, width)
  return unless text && !text.empty?

  assert_justifiable(text, width)

  line_regex = /(?<=\s|\A).{1,#{width}}(?=\s|\z)/

  lines = text.scan(line_regex)

  final_unjustified_line = lines.pop

  lines.map! { |line| justify_line(line, width) }
  lines << final_unjustified_line

  lines.join("\n")
end

def justify_line(line, width)
  num_spaces_to_add = width - line.length
  return line if num_spaces_to_add.zero?

  spacers_cycler = line.scan(' ').cycle
  return line if spacers_cycler.none?

  num_spaces_to_add.times { spacers_cycler.next << ' ' }
  spacers_cycler.rewind

  line.gsub(' ') { |space| spacers_cycler.next }
end

def assert_justifiable(text, width)
  too_long_word_regex  = /\S{#{width+1},}/
  if text =~ too_long_word_regex
    raise "Cannot justify to width #{width} without word-splitting"
  end
end
