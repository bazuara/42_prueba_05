#!/usr/bin/env ruby

require 'sinatra'
require 'yaml'
require 'oauth2'

begin
  config = YAML.load_file("secret.credentials.yml")
  client_id = config["api"]["client_id"]
  client_secret = config["api"]["client_secret"]
rescue
  puts "Wrong secret.credentials.yml file, are you sure it exist and is formated ok?"
  exit
end

client = OAuth2::Client.new(client_id, client_secret, site: "https://api.intra.42.fr")
token = client.client_credentials.get_token

#testing
get '/' do
  "Hello World!"
end

#1st Endpoint: Retrieve all personal information of the user
get '/user/:user/info' do
  content_type :json
  user_info = token.get("/v2/users/#{params[:user]}").parsed
  refined_info = Hash.new
  refined_info = {
    "Name" => user_info['first_name'],
    "Last name" =>user_info['last_name'],
    "Usual full name" => user_info['usual_full_name'],
    "Pool month": user_info['pool_month'],
    "Pool year": user_info['pool_year']
  }

  return_info = JSON.generate(refined_info)
  return_info
end


#2nd Endpoint: Retrieve all skills and expertises of the user
get '/user/:id/skills' do
  content_type :json
  user_info = token.get("/v2/users/#{params[:user]}").parsed
  
end

#3rd Endpoint: School record of a student (an extraction of all personal projects marks of the user)
#get '/user/:id/record' 
