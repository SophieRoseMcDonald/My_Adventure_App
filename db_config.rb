

#settings for active_record
require 'active_record'
options = {
  adapter: 'postgresql',
  database: 'myadventure'
}
ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
