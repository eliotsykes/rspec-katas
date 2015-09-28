
NATURAL_NOTES = {
  'C' => 0,
  'D' => 2,
  'E' => 4,
  'F' => 5,
  'G' => 7,
  'A' => 9,
  'B' => 11
}.freeze

MIN_LIMIT = NATURAL_NOTES.values.first
MAX_LIMIT = NATURAL_NOTES.values.last

SHARP_MODIFIER = '#'
FLAT_MODIFIER = 'b'

def pitch_class(pitch_class)
  note = pitch_class[0]
  modifier = pitch_class[1]
  result = NATURAL_NOTES[note]
  if SHARP_MODIFIER == modifier
    result += 1
    result = MIN_LIMIT if result > MAX_LIMIT
  elsif FLAT_MODIFIER == modifier
    result -= 1
    result = MAX_LIMIT if result < MIN_LIMIT
  end
  result
end
