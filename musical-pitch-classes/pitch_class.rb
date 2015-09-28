NATURAL_NOTES = {
  'C' => 0, 'D' => 2, 'E' => 4, 'F' => 5, 'G' => 7, 'A' => 9, 'B' => 11
}.freeze
MODIFIERS = { '#' => 1, 'b' => 11 }.freeze
NOTE_REGEX = /\A[A-G][#b]?\z/
CEILING = 12

def pitch_class(note)
  return nil unless note =~ NOTE_REGEX
  natural_note = note[0]
  suffix = note[1]
  modifier = MODIFIERS[suffix] || 0
  (NATURAL_NOTES[natural_note] + modifier) % CEILING
end
