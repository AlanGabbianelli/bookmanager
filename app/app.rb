ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @email = session[:email]
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'/links/new'
  end


  post '/links' do
    link = Link.new(url: params[:url], title: params[:Name])
    params[:tags].split.each do |tag_name|
      tag  = Tag.first_or_create(name: tag_name)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'/links/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.first_or_create(email: params[:email], password_digest: params[:password])
    session[:email] = user.email

    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end