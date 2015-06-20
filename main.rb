
require "rubygems"
require "bundler"
require "sinatra"
require "zurb-foundation"
require 'mandrill'

#  get "/" do
#  erb :index
# end

get "/" do
 erb :home
end

get "/about" do
 erb :about
end

get "/contact" do
	erb :contact
end

get "/location" do
	erb :location
end

get "/events" do
 erb :events
end 

get "/beans" do
 erb :beans
end 

get "/freetrade" do
 erb :freetrade
end 



post '/contact' do
	puts params.inspect
	email = params["email"]
	user_message = params["message"]
	puts "sending email!"
	m = Mandrill::API.new
	message = {  
	 :subject=> "New Message",  
	 :from_name=> "Deinde Dawodu",  
	 :text=>"New Message:" + user_message,
	 :to=>[  
	   {  
	     :email=> email,  
	     :name=> "Recipient1"  
	   }  
	 ],  
	 :html=>"<html><h1>New Message</h1><h3>#{user_message}</h3></html>",  
	 :from_email=>"mr.dawodu@gmail.com"  
	}  
	sending = m.messages.send message  
	puts sending
	redirect to('/thankyou')
end

get '/thankyou' do
	erb :thankyou
end

