# Non-TSort solution
#
# def recover_secret(sequences)
#   secret = ''
#   secret << extract_next_char(sequences) until sequences.empty?
#   secret
# end
#
# def extract_next_char(sequences)
#   candidates = sequences.map(&:first).uniq
#   next_char = candidates.find do |candidate|
#     sequences.all? { |sequence| sequence.index(candidate).to_i.zero? }
#   end
#   sequences.each { |sequence| sequence.delete(next_char) }
#   sequences.delete_if &:empty?
#   next_char
# end


# TSort solution
require 'tsort'

def recover_secret(sequences)
  Decoder.decode(sequences)
end

class Decoder
  include TSort

  def self.decode(sequences)
    new(sequences).decode
  end

  def initialize(sequences)
    @sequences = sequences
  end

  def decode
    build_letter_graph
    letters.join
  end

  private

  def build_letter_graph
    @letter_graph = Hash.new { |graph, letter| graph[letter] = Set.new }
    @sequences.each do |sequence|
      sequence.each_cons(2) do |earlier_letter, later_letter|
        @letter_graph[later_letter] << earlier_letter
      end
    end
    @letter_graph.default = Set.new
  end

  def each_letter(&block)
    @letter_graph.each_key(&block)
  end

  def each_earlier_letter(later_letter, &block)
    @letter_graph[later_letter].each(&block)
  end

  alias letters tsort
  alias tsort_each_node each_letter
  alias tsort_each_child each_earlier_letter

end
