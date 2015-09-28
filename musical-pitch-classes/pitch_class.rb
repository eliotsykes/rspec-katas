
NATURAL_NOTES = {
  'C' => 0,
  'D' => 2,
  'E' => 4,
  'F' => 5,
  'G' => 7,
  'A' => 9,
  'B' => 11
}.freeze

SHARP_MODIFIER = '#'
FLAT_MODIFIER = 'b'

MODIFIERS = {
  SHARP_MODIFIER => 1,
  FLAT_MODIFIER => -1
}

MIN_LIMIT = NATURAL_NOTES.values.first
MAX_LIMIT = NATURAL_NOTES.values.last



def pitch_class(pitch_class)
  note = pitch_class[0]
  modifier = MODIFIERS[pitch_class[1]] || 0
  result = NATURAL_NOTES[note] + modifier
  result = MIN_LIMIT if result > MAX_LIMIT
  result = MAX_LIMIT if result < MIN_LIMIT
  result
end
