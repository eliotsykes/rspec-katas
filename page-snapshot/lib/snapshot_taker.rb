require "open-uri"
require "nokogiri"

module SnapshotTaker

  def self.fetch_title(url)
    document = Nokogiri::HTML(open(url))
    document.title
  end

  def self.fetch_favicon(url)
    favicon_uri = guess_favicon_url
    
  end

  def self.guess_favicon_url(url)
    uri = URI.parse(url)
    favicon_uri = URI::HTTP.build({
      host: uri.host,
      path: "/favicon.ico"
    })
    favicon_uri.to_s
  end

end
