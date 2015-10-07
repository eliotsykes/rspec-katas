module Abbreviator
  def self.abbreviate(str)
    return str if str.nil? || str.empty?
    str.gsub(/(?<=\w)\w{2,}(?=\w)/) { |match| match.length }
  end
end
