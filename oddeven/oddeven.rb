require "prime"

module OddEven

  def self.print
    (1..100).map do |i|
      Prime.prime?(i) ? i : even_or_odd_string(i)
    end.join(" ")
  end

  private

  def self.even_or_odd_string(num)
    num.even? ? "Even" : "Odd"
  end

end
