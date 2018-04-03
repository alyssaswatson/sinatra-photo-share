class PhotoController < ApplicationController

  get '/photos' do
    erb :'photos/photos'
  end

end
