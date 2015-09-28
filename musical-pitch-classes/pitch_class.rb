
NATURAL_NOTES = {
  'C' => 0,
  'D' => 2,
  'E' => 4,
  'F' => 5,
  'G' => 7,
  'A' => 9,
  'B' => 11
}.freeze

def pitch_class(pitch_class)
  NATURAL_NOTES[pitch_class]
end
