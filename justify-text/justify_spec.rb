require_relative 'justify'

describe 'justify' do

  context 'justify(text, width)' do

    it 'returns nil for nil text arg' do
      expect(justify(nil, 20)).to eq nil
    end

    it 'raises error if longest word is greater than width' do
      expect do
        justify("something something something", 8)
      end.to raise_error(
        RuntimeError,
        "Cannot justify to width 8 without word-splitting"
      )
    end

    it 'justifies short text by given width' do
      expect(justify('123 45 6', 7)).to eq "123  45\n6"
    end

    it 'justifies longer text by given width' do
      text = "Lorem ipsum dolor sit amet, consec adipiscing elit. Donec at soldales metus."
      width = 20

      justified =
        "Lorem   ipsum  dolor\n" +
        "sit   amet,   consec\n" +
        "adipiscing     elit.\n" +
        "Donec   at  soldales\n" +
        "metus."

      expect(justify(text, width)).to eq justified
    end

    it 'does not justify last line' do
      text = "Lorem ipsum dolor sit amet, consec adipiscing elit."
      width = 27

      justified =
        "Lorem ipsum dolor sit amet,\n" +
        "consec adipiscing elit."

      expect(justify(text, width)).to eq justified
    end

  end

  context 'justify_line(line, width)' do

    it 'does not justify a line with correct width already' do
      expect(justify_line("hello world", 11)).to eq "hello world"
    end

    it 'justifies a line with 2 words until width met' do
      expect(justify_line("hello world", 14)).to eq "hello    world"
    end

    it 'justifies a line with 3 words and a comma until width met' do
      expect(justify_line("sit amet, consec", 20)).to eq "sit   amet,   consec"
    end

    it 'does not add whitespace to a line with 1 word' do
      expect(justify_line("consectetur", 15)).to eq "consectetur"
    end

    it 'justifies a 4 word, 25 char width line correctly' do
      expect(justify_line("Lorem ipsum dolor sit", 25)).to eq "Lorem   ipsum  dolor  sit"
    end

  end
end
