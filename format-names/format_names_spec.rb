require_relative 'format_names'

describe 'list(nameables)' do

  it 'returns an empty string for nil arg' do
    expect(list(nil)).to eq ''
  end

  it 'returns an empty string for empty arg' do
    empty = []
    expect(list(empty)).to eq ''
  end

  it 'returns one name for one nameable' do
    nameables = [
      {name: 'Peggy'}
    ]
    expect(list(nameables)).to eq 'Peggy'
  end

  it 'returns Name1 & Name2 for 2 nameables' do
    nameables = [
      {name: 'Mel'},
      {name: 'Sue'}
    ]
    expect(list(nameables)).to eq 'Mel & Sue'
  end

  it 'returns Name1, Name2 & Name3 for 3 nameables' do
    nameables = [
      {name: 'Snap'},
      {name: 'Crackle'},
      {name: 'Pop'},
    ]
    expect(list(nameables)).to eq 'Snap, Crackle & Pop'
  end

  it 'returns Name1, Name2, Name3 & Name4 for 4 nameables' do
    nameables = [
      {name: 'Marge'},
      {name: 'Homer'},
      {name: 'Lisa'},
      {name: 'Bart'},
    ]
    expect(list(nameables)).to eq 'Marge, Homer, Lisa & Bart'
  end
end
