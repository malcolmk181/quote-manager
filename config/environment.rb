require "bundler/setup"
require "sinatra/activerecord"
require "io/console"

Bundler.require
require_all 'app/models'
require_all 'lib'

ENV['SINATRA_ENV'] ||= 'development'

ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

# disables sql logging
ActiveRecord::Base.logger = nil