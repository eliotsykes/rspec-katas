require_relative "../lib/snapshot_taker"

describe SnapshotTaker do

  context ".fetch_title(url)" do

    it "should return the title from the page at the given URL" do
      url = "http://www.webdevbreak.com/"
      expect(SnapshotTaker.fetch_title(url)).to eq("Web Dev Break: Screencasts for web developers")
    end

  end

  context ".guess_favicon_url(url)" do

    it "should build the correct URL" do
      url = "http://en.wikipedia.org/wiki/Main_Page"
      expect(SnapshotTaker.guess_favicon_url(url)).to eq("http://en.wikipedia.org/favicon.ico")
    end

  end

  context ".fetch_favicon(url)" do

    before do
      @target_file_path = "page-snapshot/spec/support/downloaded-favicon.tmp.ico"
      FileUtils.rm @target_file_path, force: true
    end

    it "should fetch the favicon for the given URL" do
      
      url = "http://en.wikipedia.org/wiki/Main_Page"
      path_for_expected_favicon = "#{Dir.pwd}/page-snapshot/spec/support/favicon-wikipedia.ico"

      SnapshotTaker.fetch_favicon(url, @target_file_path)
      
      expect(md5_hash(@target_file_path)).to(
        eq(md5_hash(path_for_expected_favicon)),
        "Downloaded favicon is not as expected"
      )

    end

  end

  def md5_hash(file_path)
    Digest::MD5.hexdigest(File.read(file_path))
  end

end
