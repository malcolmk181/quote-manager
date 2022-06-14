require "bundler/setup"
require "sinatra/activerecord"
require "io/console"
require_relative '../lib/functions.rb'

Bundler.require
require_all 'app/models'

ENV['SINATRA_ENV'] ||= 'development'

ActiveRecord::Base.establish_connection(ENV['SINATRA_ENV'].to_sym)

# disables sql logging
ActiveRecord::Base.logger = nil