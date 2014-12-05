require "open-uri"
require "nokogiri"

module SnapshotTaker

  def self.fetch_title(url)
    document = Nokogiri::HTML(open(url))
    document.title
  end

  def self.fetch_favicon(url)
    favicon_url = guess_favicon_url(url)
    target_file_path = "downloaded-favicon.ico"
    
    open(favicon_url) do |source_file|
      write_binary_file_mode = "wb"
      
      File.open(target_file_path, write_binary_file_mode) do |target_file|
        target_file.puts source_file.read
      end
    end

    target_file_path
  end

  def self.guess_favicon_url(url)
    uri = URI.parse(url)
    favicon_uri = URI::HTTP.build({ host: uri.host, path: "/favicon.ico" })
    favicon_uri.to_s
  end

end
