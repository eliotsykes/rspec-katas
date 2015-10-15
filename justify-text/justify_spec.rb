require_relative 'justify'

describe 'justify(text, width)' do

  it 'returns nil for nil text arg' do
    expect(justify(nil, 20)).to eq nil
  end

  it 'raises error if longest word is greater than width' do
    expect { justify("something something something", 8) }.to raise_error ArgumentError
  end

  it 'justifies text by given width' do
    expect(justify('123 45 6', 7)).to eq "123  45\n6"
  end

end
