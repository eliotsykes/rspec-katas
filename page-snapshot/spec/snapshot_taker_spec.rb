require_relative "../lib/snapshot_taker"

describe SnapshotTaker do

  context ".fetch_title(url)" do

    it "should return the title from the page at the given URL" do
      url = "http://www.webdevbreak.com/"
      expect(SnapshotTaker.fetch_title(url)).to eq("Web Dev Break: Screencasts for web developers")
    end

  end

  context ".guess_favicon_url(url)" do

    it "should build the correct url" do
      url = "http://en.wikipedia.org/wiki/Main_Page"
      expect(SnapshotTaker.guess_favicon_url(url)).to eq("http://en.wikipedia.org/favicon.ico")
    end

  end


end
