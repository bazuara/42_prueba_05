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
#1st Endpoint: Retrieve all personal information of the user

get '/user/:user/info' do
  content_type :json
  #"#{params[:user]}"
  user_info = token.get("/v2/users/#{params[:user]}").parsed
  return_info = JSON.generate(user_info)
  #return_info = user_info.generate
  return_info
end

get '/' do
  "Hello World!"
end

#2nd Endpoint: Retrieve all skills and expertises of the user
#get '/user/:id/skills'

#3rd Endpoint: School record of a student (an extraction of all personal projects marks of the user)
#get '/user/:id/record' 
