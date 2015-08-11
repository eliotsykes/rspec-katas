module SelfDescribingNumberDetector

  def self.parse_file(filename)
    file = File.new filename
    file.each_line do |line|
      puts self_describing_number?(line) ? 1 : 0
    end
  end

  def self.self_describing_number?(num)
    num.chars.each_with_index do |char, index|
      desired_count = char.to_i
      digit_to_count = index.to_s
      has_desired_count = (num.count(digit_to_count) == desired_count)
      return false if !has_desired_count
    end
    true
  end

end
