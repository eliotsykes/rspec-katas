require_relative "lib/snapshot_taker"

url = ARGV.last
title = SnapshotTaker.fetch_title(url)
puts title

