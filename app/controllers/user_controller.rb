class UserController < ApplicationController

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    if params[:password] == "" || params[:username] == ""
      redirect '/users/new'
    else
      @user = User.create(params)
      redirect '/users/'
    binding.pry
  end

end
