
NATURAL_NOTES = {
  'C' => 0,
  'D' => 2,
  'E' => 4,
  'F' => 5,
  'G' => 7,
  'A' => 9,
  'B' => 11
}.freeze

MODIFIERS = {
  '#' => 1,
  'b' => -1,
  'B#' => -11,
  'Cb' => 11
}

def pitch_class(note)
  return nil unless note =~ /\A[CDEFGAB][#b]?\z/
  natural_note = note[0]
  NATURAL_NOTES[natural_note] + modifier(note)
end

private

def modifier(note)
  suffix = note[1]
  MODIFIERS[note] || MODIFIERS[suffix] || 0
end
