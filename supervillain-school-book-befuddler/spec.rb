require_relative 'befuddle'

describe 'befuddle(text)' do

  it 'returns empty string for blank arguments' do
    expect(befuddle(nil)).to eq ''
    expect(befuddle('')).to eq ''
    expect(befuddle(' ')).to eq ''
    expect(befuddle('    ')).to eq ''
  end

  it 'does not modify the given whitespace only text' do
    text = '   '
    befuddle(text)
    expect(text).to eq '   '
  end

  it 'does not modify the given text' do
    text = 'Apples.'
    befuddle(text)
    expect(text).to eq 'Apples.'
  end

  it 'befuddles text' do
    text = "The quick brown fox jumped over the lazy dog and as interesting as that it is it will not stop me from completing building The Book Befuddler. Behold the supervillain weapon that all other supervillain weapons envy it is marvellous. Have a nice day."

    expect(befuddle(text)).to eq "ehT QUICK brow Fox 6 over lazy god AND a Interesting 2 that is ti WILL no Stop 2 from building ehT BOOK Befuddle. dloheB THE supervillai Weapon 4 all supervillain snopaew ENVY i Is 10. evaH A nic Day."
  end

  it 'befuddles sentences containing only single letter words' do
    text = "A e I o U B C d f g H j X Y Z A x c."
    expect(befuddle(text)).to eq "A E O 1 b d f G J 1 y A x C."
  end

  it 'strips any surrounding whitespace' do
    text = "  Apples and pears.  Cabbages and cauliflowers. "
    expect(befuddle(text)).to eq "selppA AND pear. segabbaC AND cauliflower."
  end

  it 'squeezes consecutive whitespace to a single whitespace' do
    text = "This     is a   string."
    expect(befuddle(text)).to eq "sihT IS String."
  end


end
