class UserController < ApplicationController

  get '/users/new' do
    if !logged_in?
      erb :'users/new'
    else
      flash[:message] = "You are already logged in!"
      redirect to 'photos'
    end
  end

  post '/users' do
    if params[:password] == "" || params[:username] == ""
      flash[:message] = "You must fill out all fields"
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
     flash[:message] = "You are already logged in!"
     redirect to '/photos'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/photos'
    else
      flash[:message] = "Sorry, your username or password do not match an existing account"
      redirect to '/users/new'
    end
  end

  get '/logout' do
      if logged_in?
        session.clear
        redirect to '/login'
      else
        flash[:message] = "You are already logged out!"
        redirect to '/'
      end
    end


end
