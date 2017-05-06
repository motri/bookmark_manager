ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
# it manages the bookmark_manager web app
class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    erb :'links/login'
  end

  post '/logged' do
    user = User.create(user: params[:user],
                       password: params[:password])
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/join' do
    erb :'links/sign_up'
  end
  post '/users' do
    user = User.create(user: params[:user],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
  session[:user_id] = user.id
  redirect '/home'
  end

  get '/home' do
    erb :'links/home'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tag].split('; ').each do |tag|
      link.tag << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
