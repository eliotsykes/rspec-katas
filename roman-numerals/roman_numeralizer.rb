class RomanNumeral

  attr_accessor :numerals, :numeral_symbol
  attr_writer :number

  def to_i
    number
  end

  def number
    @number ||= @numerals.map(&:number).reduce(:+)
  end

  def to_s
    @numerals.map(&:numeral_symbol).join
  end

  def ==(other)
    other.to_i == to_i
  end

  def <=>(other)
    to_i <=> other.to_i
  end

  def <=(other)
    to_i <= other.to_i
  end

  def self.create(number)
    
    remainder = number
    primitives_in_descending_order = Primitives.all.reverse
    numerals = []
    
    while remainder > 0
      largest_primitive_in_remainder = primitives_in_descending_order.find { |primitive| primitive <= remainder }
      if largest_primitive_in_remainder == number
        return largest_primitive_in_remainder
      end
      numerals << largest_primitive_in_remainder
      remainder = remainder - largest_primitive_in_remainder.to_i
    end
    
    result = RomanNumeral.new
    result.numerals = numerals
    result
  end

  module Primitives

    def self.all
      @primitives.freeze unless @primitives.frozen?
      @primitives
    end

    private

    def self.create_primitive(number, numeral_symbol)
      primitive = RomanNumeral.new
      primitive.number = number
      primitive.numeral_symbol = numeral_symbol
      primitive.numerals = [primitive].freeze
      @primitives = [] unless @primitives
      @primitives << primitive
      @primitives.sort!
    end

    I  = create_primitive(1, :I)
    IV = create_primitive(4, :IV)
    V  = create_primitive(5, :V)
    IX = create_primitive(9, :IX)
    X  = create_primitive(10, :X)

  end

end

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
    RomanNumeral.create(number_to_convert)
  end

  def self.print_usage_and_exit
    puts "Usage: 'ruby roman-numerals/roman_numeralizer.rb NUMBER' where NUMBER is a positive integer"
    exit
  end

end

RomanNumeralizer.execute(ARGV)


