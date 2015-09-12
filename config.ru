
require 'rubygems'
require 'bundler'
require 'rack'
require './app'
Bundler.require





use Rack::Session::Cookie, :key => 'rack.session',
    :expire_after => 2592000,
    :secret => SecureRandom.hex(64)



DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://db/main.db')
#DB = Sequel.connect(:adapter => 'postgres', :user => 'username', :password => "passw0rd", :host => "xxx.xxx.xxx.xxx" , :database => "//db/main.db")

require './models.rb'

run Sinatra::Application