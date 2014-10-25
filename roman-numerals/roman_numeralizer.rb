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

  BOUNDS = [1, 3000].freeze

  def self.create(number)
    
    within_bounds = number >= BOUNDS.first && number <= BOUNDS.last
    raise ArgumentError, "Number must be within bounds #{BOUNDS} inclusive" unless within_bounds

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
    XL = create_primitive(40, :XL)
    L  = create_primitive(50, :L)
    XC = create_primitive(90, :XC)
    C  = create_primitive(100, :C)
    CD = create_primitive(400, :CD)
    D  = create_primitive(500, :D)
    CM = create_primitive(900, :CM)
    M  = create_primitive(1000, :M)

  end

end

module RomanNumeralizer

  def self.execute(arguments)
    cli_arg_needed = arguments.empty?
    print_usage_and_exit if cli_arg_needed

    number_to_convert = arguments[0].to_i
    
    begin
      roman_numerals = RomanNumeral.create(number_to_convert)
    rescue ArgumentError
      print_usage_and_exit
    end
    
    puts "#{roman_numerals.to_i} -> #{roman_numerals}"
  end

  private

  def self.print_usage_and_exit
    puts "Usage: 'ruby roman-numerals/roman_numeralizer.rb NUMBER' where " +
      "NUMBER is a positive integer from #{RomanNumeral::BOUNDS.first} to " +
      "#{RomanNumeral::BOUNDS.last} inclusive"
    exit
  end

end

RomanNumeralizer.execute(ARGV)


