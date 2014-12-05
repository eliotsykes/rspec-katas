require_relative "../lib/snapshot"

describe Snapshot do

  context ".take(url)" do

    before do
      @target_file_path = "/tmp/downloaded-favicon.ico"
      FileUtils.rm @target_file_path, force: true
    end

    it "takes a snapshot for given URL" do

      url = "http://en.wikipedia.org/wiki/Main_Page"
      path_for_expected_favicon = "#{Dir.pwd}/page-snapshot/spec/support/favicon-wikipedia.ico"

      snapshot = Snapshot.take(url)

      expect(snapshot.title).to eq("Wikipedia, the free encyclopedia")
      expect(snapshot.favicon_path).to eq(@target_file_path)

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
