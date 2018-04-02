class UserController < ApplicationController

  get '/users/new' do
    erb :index
  end

end
