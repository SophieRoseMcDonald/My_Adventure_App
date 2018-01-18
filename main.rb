
require 'sinatra'

# require_relative 'sinatra/reloader'
require_relative 'db_config' #db_config must go above models
require_relative 'models/adventure'
require_relative 'models/tag'
require_relative 'models/comment'
require_relative 'models/user'

enable :sessions

get '/' do
   @adventure = Adventure.all
   @tag = Tag.all
  erb :index
end
#Create
get '/adventures/new' do
  erb :new
end
#add/save adventure to database
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
  @comments = Comment.where(adventure_id: @adventure.id)
  @tags = @adventure.tags
  erb :show
end

#update
get'/adventures/:id/edit' do
  @adventure = Adventure.find(params[:id])
  erb :edit
end
#update
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
#delete adventure
delete '/adventures/:id' do
  adventure = Adventure.find(params[:id])
  adventure.destroy
  redirect '/'
end
#comments
post '/comments' do
  comment = Comment.new
  comment.body = params[:body]
  comment.adventure_id = params[:adventure_id]
  comment.save
  redirect "/adventures/#{comment.adventure_id}"
end

# get '/registration' do
#   erb :registration
# end
#
# get '/users' do
#   user = User.new
#   user.email = params[:email]
#   user.password = params[:password]
#   user.save
#   redirect '/'
# end

#login
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
