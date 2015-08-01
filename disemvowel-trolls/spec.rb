require_relative 'disemvowel'

describe '#disemvowel' do

  it "removes vowels from given string" do
    expect(disemvowel("This website is for losers LOL!")).to eq "Ths wbst s fr lsrs LL!"
  end

  it "removes uppercase vowels" do
    expect(disemvowel("ApplEs ARE TASTY!")).to eq "ppls R TSTY!"
  end

  it "removes lowercase vowels" do
    expect(disemvowel("Hello World :-)")).to eq "Hll Wrld :-)"
  end

  it "returns voweless argument untouched" do
    expect(disemvowel("BCD FGH jklMN pQrStVwXyZ")).to eq "BCD FGH jklMN pQrStVwXyZ"
  end

  it "returns nil for nil input" do
    expect(disemvowel(nil)).to be_nil
  end

  it "returns blank string for blank input" do
    expect(disemvowel("")).to eq ""
  end

  it "returns whitespace string untouched" do
    expect(disemvowel("     ")).to eq "     "
  end

end
