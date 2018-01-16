
require 'sinatra'
require 'sinatra/reloader'

require_relative 'db_config'
require_relative 'models/adventure'
require_relative 'models/tag'
require_relative 'models/comment'
require_relative 'models/user'


get '/' do
   @adventure = Adventure.all
  erb :index
end
#Create
get '/adventures/new' do
  erb :new
end

post '/adventures' do
adventure = Adventure.new
adventure.name = params[:name]
adventure.image_url = params[:image_url]
adventure.address = params[:address]
adventure.details = params[:details]
adventure.special_mention = params[:special_mention]
adventure.save
redirect '/'
  # http://www.banyulenillumbikkids.com.au/web/wp-content/uploads/2016/08/park.jpg
end

#read
get '/adventures/:id' do
  #   redirect '/login' unless logged_in?
  @adventure = Adventure.find(params[:id])
  erb :show
end

#update
get'/adventures/:id/edit' do
  @adventure = Adventure.find(params[:id])
  erb :edit
end

put '/adventures/:id' do
  adventure = Adventure.find(params[:id])
  adventure.name = params[:name]
  adventure.image_url = params[:image_url]
  adventure.address = params[:address]
  adventure.details = params[:details]
  adventure.special_mention = params[:special_mention]
  adventure.save
  redirect "adventures/#{params[:id]}"
end

delete '/adventures/:id' do
  adventure = Adventure.find(params[:id])
  adventure.destroy
  redirect '/'
end

post '/comments' do
  comment = Comment.new
  comment.body = params[:body]
  comment.adventure_id = params[:adventure_id]
  comment.save
  redirect "/adventures/#{comment.adventure_id}"
end
