require 'sinatra'
require "sinatra/json"
require 'active_record'
require 'json'

set :bind, '0.0.0.0'
set :server, 'webrick'
set :port, 80

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "10.0.4.83",
  :username => "root",
  :password => "michael31",
  :database => "Examination-Database"
)

class Foundations < ActiveRecord::Base
end

class App < Sinatra::Application
end

get '/' do
        File.read('mainMenu.html')
end

get '/addFoundationsGraduate' do
        File.read('addFoundationsGraduate.html')
end
