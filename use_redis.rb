require 'redis'

r = Redis.new

r.del('foo')

puts

p'set foo to "bar"'
r['foo'] = 'bar'

puts

p 'value of foo'
p r['foo']

puts
p 'incr'
r.del 'counter'

p r.incr('counter')
p r.incr('counter')
p r.incr('counter')

puts
p 'decr'
p r.decr('counter')
p r.decr('counter')
p r.decr('counter')

r.del 'logs'

puts

p "pushing log messages into a LIST"
r.rpush 'logs', 'some log message'
r.rpush 'logs', 'another log message'
r.rpush 'logs', 'yet another log message'
r.rpush 'logs', 'also another log message'

puts
p 'contents of logs LIST'

p r.lrange('logs', 0, -1)

puts
p 'Trim logs LIST to last 2 elements(easy circular buffer)'

r.ltrim('logs', -2, -1)

p r.lrange('logs', 0, -1)

trap(:INT) { puts; exit }

begin
  redis.subscribe(:one, :two) do |on|
    on.subscribe do |channel, subscriptions|
      puts "Subscribed to ##{channel} (#{subscriptions} subscriptions)"
    end

    on.message do |channel, message|
      puts "##{channel}: #{message}"
      redis.unsubscribe if message == "exit"
    end

    on.unsubscribe do |channel, subscriptions|
      puts "Unsubscribed from ##{channel} (#{subscriptions} subscriptions)"
    end
  end
rescue Redis::BaseConnectionError => error
  puts "#{error}, retrying in 1s"
  sleep 1
  retry
end

r.del 'foo-tags'
r.del 'bar-tags'

puts
p "create a set of tags on foo-tags"

r.sadd 'foo-tags', 'one'
r.sadd 'foo-tags', 'two'
r.sadd 'foo-tags', 'three'

puts
p "create a set of tags on bar-tags"

r.sadd 'bar-tags', 'three'
r.sadd 'bar-tags', 'four'
r.sadd 'bar-tags', 'five'

puts
p 'foo-tags'

p r.smembers('foo-tags')

puts
p 'bar-tags'

p r.smembers('bar-tags')

puts
p 'intersection of foo-tags and bar-tags'

p r.sinter('foo-tags', 'bar-tags')
