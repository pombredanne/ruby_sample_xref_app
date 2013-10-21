Gem::Specification.new do |s|
  s.name        = 'ruby_sample_xref_app'
  s.version     = '0.0.1'
  s.date        = '2013-10-20'
  s.summary     = "Sample Ruby Cross-reference App"
  s.description = "A sample Ruby app for use with Sourcegraph"
  s.authors     = ["Quinn Slack"]
  s.email       = 'sqs@sourcegraph.com'
  s.files       = ["lib/use_tire.rb", "lib/use_yajl.rb", "lib/use_stripe.rb", "lib/use_groupdate.rb", "lib/use_redis.rb", "lib/use_searchkick.rb", "lib/use_geocoder.rb", "lib/use_barkick.rb"]
  s.homepage    =
    'https://github.com/sourcegraph/ruby_sample_xref_app'
  s.license     = 'MIT'
  s.require_path = 'lib/'
end
