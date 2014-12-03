require_relative "snapshotter"

describe Snapshotter do

  context ".fetch_title(url)" do

    it "should return the title from the page at the given URL" do
      url = "http://www.webdevbreak.com/"
      expect(Snapshotter.fetch_title(url)).to eq("Web Dev Break: Screencasts for web developers")
    end

  end


end