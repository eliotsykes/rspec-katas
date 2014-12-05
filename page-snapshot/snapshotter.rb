require_relative "lib/snapshot"

USAGE = "Usage: Provide a URL as the final command line option to see the page's title"
missing_url = ARGV.length < 1 || ARGV.last == "--help"

if missing_url
  puts USAGE
  exit
end

url = ARGV.last
snapshot = Snapshot.take(url)
puts "Title: #{snapshot.title}"
puts "Favicon path: #{snapshot.favicon_path}"

