require 'yajl'
require 'yajl/gzip'
require 'yajl/deflate'
require 'yajl/http_stream'

hash = Yajl::Parser.parse(json)
puts hash.inspect



uri = URI.parse("http://alice:123@stream.twitter.com/1/statuses/sample.json")

Yajl::HttpStream.get(uri, :symbolize_keys => true) do |hash|
  STDOUT.putc '.'
  STDOUT.flush
  captured += 1
end


obj = {
  :a_test => "of encoding in one pass" * 512,
  :a_test2 => "of encoding in one pass" * 512,
  :a_test3 => "of encoding in one pass" * 512,
  :a_test4 => "of encoding in one pass" * 512,
  :which_will => "simply return a string when finished" * 512,
  :which_will2 => "simply return a string when finished" * 512,
  :which_will3 => "simply return a string when finished" * 512,
  :which_will4 => "simply return a string when finished" * 512,
  :as_easy_as => 123
}

chunks = 0
total_size = 0

Yajl::Encoder.encode(obj) do |chunk|
  chunks += 1
  total_size += chunk.size
  STDOUT << chunk
end

obj = {
  :a_test => "of encoding directly to an IO stream",
  :which_will => "simply return a string when finished",
  :as_easy_as => 123
}

Yajl::Encoder.encode(obj, STDOUT)
