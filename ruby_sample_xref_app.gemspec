Gem::Specification.new do |s|
  s.name        = 'ruby_sample_xref_app'
  s.version     = '0.0.1'
  s.date        = '2013-10-20'
  s.summary     = "Sample Ruby Cross-reference App"
  s.description = "A sample Ruby app for use with Sourcegraph"
  s.authors     = ["Quinn Slack"]
  s.email       = 'sqs@sourcegraph.com'
  s.files       = ["app/use_tire.rb", "app/use_yajl.rb", "app/use_stripe.rb", "app/use_groupdate.rb", "app/use_redis.rb", "app/use_searchkick.rb", "app/use_geocoder.rb", "app/use_barkick.rb"]
  s.homepage    =
    'https://github.com/sourcegraph/ruby_sample_xref_app'
  s.license     = 'MIT'
  s.require_path = 'app/'
end
