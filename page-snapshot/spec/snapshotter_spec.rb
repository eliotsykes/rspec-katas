describe "snapshotter.rb" do

  xcontext "called with --help" do
    it "prints help" do
    end
  end

  xcontext "called without options" do
    it "prints help" do
    end
  end

  context "called with a valid URL" do

    it "outputs page title on its own line" do
      output = `ruby page-snapshot/snapshotter.rb "http://en.wikipedia.org/"`
      expect(output).to eq("Wikipedia, the free encyclopedia\n")
    end

  end

end
