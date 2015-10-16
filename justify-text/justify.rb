def justify(text, width)
  return unless text && !text.empty?

  line_regex = /(?<=\s|\A).{1,#{width}}(?=\s|\z)/

  justified = ''

  text.scan(line_regex) { |line| justified << justify_line(line, width) << "\n" }

  justified.chomp!

  raise "Cannot justify to width #{width} without splitting words" if justified.empty?

  justified
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
