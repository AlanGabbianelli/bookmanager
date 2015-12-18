ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'models/data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'/links/new'
  end


  post '/links' do
    link = Link.new(url: params[:url], title: params[:Name])
    params[:tags].split(', ').each do |tag_name|
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
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.id
      session[:user_id]=@user.id
      redirect '/links'
    else
      flash.now[:error]='Cannot sign up. Mismatching passwords'
      erb :'/users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
