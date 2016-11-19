require 'sinatra'
require 'active_record'

set :bind, '0.0.0.0'
set :server, 'webrick'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "michael31",
  :database => "certificates"
)

class Foundations < ActiveRecord::Base
end

class App < Sinatra::Application
end

get '/getcertificate' do
	puts 'This is the parameter: ' + params[:email]
	puts 'hello'
end

get '/getCertificates' do
	@items = Foundations.all
	puts 'foundation'
	@items.each do |item|
		puts "================================================"
		puts "First name: " + item.firstName 
		puts "Last name: " + item.lastName
		puts "Email address: "  + item.emailAddress
		puts "================================================"
	end 
	puts @items
end

get '/hello' do
	'put this smoke up it'
end
