require_relative 'weirdcase'

describe 'weirdcase' do

  it 'should return the correct value for a single word' do
    expect(weirdcase('This')).to eq 'ThIs'
    expect(weirdcase('is')).to eq 'Is'
  end

  it 'should return the correct value for multiple words' do
    expect(weirdcase('This is a test')).to eq 'ThIs Is A TeSt'
  end

  it 'should reduce consecutive whitespace to a single space' do
    expect(weirdcase('A cup  of      coffee is   good')).to eq 'A CuP Of CoFfEe Is GoOd'
  end

  it 'should trim surrounding whitespace' do
    expect(weirdcase('   Surrounded with space    ')).to eq ('SuRrOuNdEd WiTh SpAcE')
  end

end
