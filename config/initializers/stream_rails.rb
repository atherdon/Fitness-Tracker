require 'stream_rails'

StreamRails.configure do |config|
  config.api_key     = "5j5eaez3n6ez"
  config.api_secret  = "6nhry7gvx35cugzr99t2q8cm3hy9pvshp4pbbhgmxuyqp56aag9guas3s5wks22n"
  config.timeout     = 30                # Optional, defaults to 3
  config.location    = 'us-east'         # Optional, defaults to 'us-east'
  # If you use custom feed names, e.g.: timeline_flat, timeline_aggregated,
  # use this, otherwise omit:
  #config.news_feeds = { flat: "timeline_flat", aggregated: "timeline_aggregated" }
  # Point to the notifications feed group providing the name, omit if you don't
  # have a notifications feed
  #config.notification_feed = "notifications"
end