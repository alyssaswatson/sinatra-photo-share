class UserController < ApplicationController

  get '/users/new' do
    if !logged_in?
      erb :'users/new'
    else
      redirect to 'photos'
    end
  end

  post '/users' do
    if params[:password] == "" || params[:username] == ""
      redirect to '/users/new'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      #binding.pry
      redirect to '/photos'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
     redirect to '/photos'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/photos'
    else
      redirect to '/users/new'
    end
  end

  get '/logout' do
      if logged_in?
        session.clear
        redirect to '/login'
      else
        redirect to '/'
      end
    end


end
