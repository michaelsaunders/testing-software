require 'sinatra'
require "sinatra/json"
require 'active_record'
require 'json'
require "sinatra/reloader"

set :bind, '0.0.0.0'
set :server, 'webrick'
set :port, 80

ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => "questions.db"
)

class Foundations < ActiveRecord::Base
end

class App < Sinatra::Application
end

get '/' do
	File.read('welcome.html')
end

get '/addFoundationsGraduate' do
	File.read('addFoundationsGraduate.html')
end 

get '/addFoundationsCertificate' do
	
	puts "======================================================"
	puts 'First name: ' + params[:Firstname]
	puts 'Last name: ' + params[:Lastname]
	puts 'Email Address: ' + params[:EmailAddress]
	#puts 'Date Certified: ' + params[:DateCertified]
	puts "======================================================"
	
	
	puts 'Puts params into values'
	dateCertified=params[:DateCertified]
	firstName = params[:Firstname]
        lastName = params[:Lastname]
        emailAddress = params[:EmailAddress]


	person=Foundations.where("emailAddress = ?",emailAddress).first
	 

	puts 'creating foundations certificate'
	foundations = Foundations.new do |f|
		f.firstName = firstName
		f.lastName = lastName
		f.emailAddress = emailAddress
		f.DateCertified = dateCertified
	end
	foundations.save
	puts 'finished creating foundations certificate'	

	"<html><a href=/addFoundationsGraduate>Add Next Student</a></html>"
	
	
	
end
