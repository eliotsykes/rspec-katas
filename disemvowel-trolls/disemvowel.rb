def disemvowel(text)
  return nil if text.nil?
  text.gsub /[aeiou]/i, ''
end
