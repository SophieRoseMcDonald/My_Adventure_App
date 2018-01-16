
require 'sinatra'
require 'sinatra/reloader'

require_relative 'db_config'
require_relative 'models/adventure'
require_relative 'models/tag'
require_relative 'models/comment'
require_relative 'models/user'

enable :sessions

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
  redirect '/login' unless logged_in?
  @adventure = Adventure.find(params[:id])
    @comment = Comment.where(adventure_id: @adventure.id)
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


get '/login' do
  erb :login
end

post '/session' do
  #check email exists
  user = User.find_by(email: params[:email])
  #have a user and authenticate return truthy
  #check password
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id #just a hash
    redirect '/'
  else
    erb :login
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect '/login'
end


helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in? #this method returns a boolean
    !!current_user # !! negates the current_user converting it to a true or false
  #   if session[:user_id]
  #     return true
  #   else
  #     return false
  #   end
  end
end
