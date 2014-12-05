describe "snapshotter.rb" do

  EXPECTED_USAGE = "Usage: Provide a URL as the final command line option to see the page's title\n"

  context "called with --help" do

    it "prints help" do
      expect(run_script("--help")).to eq(EXPECTED_USAGE)
    end

  end

  context "called without options" do
    
    it "prints help" do
      expect(run_script).to eq(EXPECTED_USAGE)
    end
  
  end

  context "called with a valid URL" do

    NEWLINE = $/

    it "outputs page title and downloaded favicon" do
      output = run_script("http://en.wikipedia.org/")
      expect(output).to eq([
        "Title: Wikipedia, the free encyclopedia",
        "Favicon path: /tmp/downloaded-favicon.ico" + NEWLINE
      ].join(NEWLINE))
    end

  end

  def run_script(options_str=nil)
    command = "ruby page-snapshot/snapshotter.rb"
    command << " #{options_str}" if options_str
    %x|#{command}|
  end

end
