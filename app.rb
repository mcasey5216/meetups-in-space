require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'
# require 'faker'

require_relative 'config/application'
set :environment, :development

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end

get '/auth/github/callback' do
  auth = env['omniauth.auth']

  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/example_protected_page' do
  authenticate!
end

get '/' do
  @meetups = Meetup.all.order(name: :asc)
  erb :index
end

get '/submit' do
  erb :new
end

get '/:id' do
  @meetup = Meetup.find(params[:id])
  @membership = Membership.where(meetup_id: params[:id])
  erb :show
end

post '/join' do
  @fields = {user_id: params[:user_id], meetup_id: params[:meetup_id]}
  Membership.find_or_create_by(@fields)
  flash[:notice] = "You have joined the meetup."
  redirect "/#{@fields[:meetup_id]}"
end

post '/submit' do
  if signed_in?
    new = Meetup.create(name: params["meetup"], location: params["location"], description: params["description"])
    flash[:notice] = "Meetup successfully created!"
    redirect "/#{new.id}"
  else
    flash[:notice] = "Please sign in."
    redirect '/submit'
  end
end
