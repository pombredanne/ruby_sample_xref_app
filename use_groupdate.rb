require 'groupdate'
require 'active_record'

class User < ActiveRecord::Base
end

class Task < ActiveRecord::Base
end

class Goal < ActiveRecord::Base
end

User.group_by_day(:created_at).count
# {
#   2013-04-16 00:00:00 UTC => 50,
#   2013-04-17 00:00:00 UTC => 100,
#   2013-04-18 00:00:00 UTC => 34
# }

Task.group_by_month(:updated_at).count
# {
#   2013-02-01 00:00:00 UTC => 84,
#   2013-03-01 00:00:00 UTC => 23,
#   2013-04-01 00:00:00 UTC => 44
# }

Goal.group_by_year(:accomplished_at).count
# {
#   2011-01-01 00:00:00 UTC => 7,
#   2012-01-01 00:00:00 UTC => 11,
#   2013-01-01 00:00:00 UTC => 3
# }

User.group_by_week(:created_at, "Pacific Time (US & Canada)").count

time_zone = ActiveSupport::TimeZone["Pacific Time (US & Canada)"]

User.group_by_week(:created_at, time_zone).count

User.group_by_week(:created_at, :start => :mon) # first three letters of day

# must be the last argument
User.group_by_week(:created_at, time_zone, :start => :sat)

# change globally
Groupdate.week_start = :mon

# day of the week
User.group_by_day_of_week(:created_at).count
# {
#   0 => 54, # Sunday
#   1 => 2,  # Monday
#   ...
#   6 => 3   # Saturday
# }

# hour of the day
User.group_by_hour_of_day(:created_at, "Pacific Time (US & Canada)").count
# {
#   0 => 34,
#   1 => 61,
#   ...
#   23 => 12
# }



User.group_by_day(:created_at).order("day asc").count

User.group_by_week(:created_at).order("week desc").count

User.group_by_hour_of_day(:created_at).order("hour_of_day asc").count


Task.completed.group_by_hour(:completed_at).average(:priority)

User.group_by_day(:created_at).count
User.group_by_day_of_week(:created_at, Time.zone, time_range).count
