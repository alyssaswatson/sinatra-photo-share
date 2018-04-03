class UserController < ApplicationController

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    if params[:password] == "" || params[:username] == ""
      redirect '/users/new'
    else
      @user = User.create(params)
      #binding.pry
      redirect to '/photos'
    end
  end

  get '/login' do
    erb :'users/login'
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

end
