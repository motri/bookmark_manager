ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
# it manages the bookmark_manager web app
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :'links/home'
  end

  post '/home' do
    user = User.create(user: params[:user], password: params[:password])
    user.save
    erb :'links/welcome'
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
end
