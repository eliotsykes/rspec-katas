def seven(m)
  steps = 0
  numerator = m

  until numerator < 100
    x, y = numerator.divmod(10)
    numerator = x - (2*y)
    steps += 1
  end

  [numerator, steps]
end
