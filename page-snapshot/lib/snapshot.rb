require "open-uri"
require "nokogiri"

class Snapshot

  attr_accessor :url, :title, :favicon_path

  def self.take(url)
    snapshot = Snapshot.new(url)
    snapshot.take
  end

  def initialize(url)
    self.url = url
  end

  def take
    fetch_title
    fetch_favicon
    self
  end

  private

  def fetch_title
    document = Nokogiri::HTML(open(url))
    self.title = document.title
  end
  
  def fetch_favicon
    self.favicon_path = "/tmp/downloaded-favicon.ico"
    
    open(guess_favicon_url) do |source_file|
      write_binary_file_mode = "wb"
      
      File.open(favicon_path, write_binary_file_mode) do |target_file|
        target_file.puts source_file.read
      end
    end
  end

  def guess_favicon_url
    uri = URI.parse(url)
    favicon_uri = URI::HTTP.build({ host: uri.host, path: "/favicon.ico" })
    favicon_uri.to_s
  end
end

