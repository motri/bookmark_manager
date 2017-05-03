ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url],
                    title: params[:title])
    tag  = Tag.first_or_create(name: params[:tag])
    link.tag << tag
    link.save
    redirect to('/links')
  end
end
