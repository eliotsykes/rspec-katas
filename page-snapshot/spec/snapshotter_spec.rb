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

    it "outputs page title on its own line" do
      output = run_script("http://en.wikipedia.org/")
      expect(output).to eq("Wikipedia, the free encyclopedia\n")
    end

  end

  def run_script(options_str=nil)
    command = "ruby page-snapshot/snapshotter.rb"
    command << " #{options_str}" if options_str
    %x|#{command}|
  end

end
