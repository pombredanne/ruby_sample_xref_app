require 'geocoder'

Geocoder.configure(

  # geocoding service (see below for supported options):
  :lookup => :yandex,

  # to use an API key:
  :api_key => "...",

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # set default units to kilometers:
  :units => :km,

  # caching (see below for details):
  :cache_prefix => "..."

)
Geocoder.configure(:lookup => :dstk, :host => "localhost:4567")


Geocoder.search("Paris", :params => {:countrycodes => "gb,de,fr,es,us"})
Geocoder.search("Paris", :bounds => [[32.1,-95.9], [33.9,-94.3]])
results = Geocoder.search("McCarren Park, Brooklyn, NY")
Geocoder::Lookup.get(:google).query_url(Geocoder::Query.new("..."))


# TODO: add examples of usage with ActiveRecord/Rails
