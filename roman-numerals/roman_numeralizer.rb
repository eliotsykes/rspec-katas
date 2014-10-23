module RomanNumeralizer

  def self.execute(arguments)
    cli_arg_needed = arguments.empty?
    print_usage_and_exit if cli_arg_needed

    number_to_convert = arguments[0].to_i
    print_usage_and_exit if !convertible?(number_to_convert)

    puts "#{number_to_convert} -> #{to_numerals(number_to_convert)}"
  end

  private

  def self.convertible?(number_to_convert)
    number_to_convert >= 1
  end

  def self.to_numerals(number_to_convert)
    "I" * number_to_convert
  end

  def self.print_usage_and_exit
    puts "Usage: 'ruby roman-numerals/roman_numeralizer.rb NUMBER' where NUMBER is a positive integer"
    exit
  end

end

RomanNumeralizer.execute(ARGV)
