
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

def pitch_class(pitch_class)
  note = pitch_class[0]
  NATURAL_NOTES[note] + modifier(pitch_class)
end

private

def modifier(pitch_class)
  suffix = pitch_class[1]
  MODIFIERS[pitch_class] || MODIFIERS[suffix] || 0
end
