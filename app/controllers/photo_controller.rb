class PhotoController < ApplicationController

  get '/photos' do
    #binding.pry
    if logged_in?
      @photos = Photo.all
      erb :'photos/photos'
    else
      redirect to '/login'
    end
  end

  get '/photos/new' do
    if logged_in?
      erb :'photos/new'
    else
      redirect to '/login'
    end
  end

  post '/photos' do
    #binding.pry
    if logged_in?
      if params[:link] != "" && params[:caption] != ""
        @photo = current_user.photos.build(caption: params[:caption], link: params[:link])
        @photo.save
        #binding.pry
        redirect to "/photos/#{@photo.id}"
      else
        redirect to '/photos/new'
      end
    else
      redirect to '/login'
    end
  end

  get '/photos/:id' do
    #binding.pry
    @photo = Photo.find_by_id(params[:id])
    erb :'photos/show'
  end

  get '/photos/:id/edit' do
    @photo = Photo.find_by_id(params[:id])
    binding.pry
    erb :'photos/edit'
  end

  patch '/photos/:id' do
    @photo = Photo.find_by_id(params[:id])
    @photo.link = params[:link]
    @photo.caption = params[:caption]
    @photo.save
    redirect to "/photos/#{@photo.id}"
  end

  delete '/photos/:id/delete' do
    @photo = Photo.find_by_id(params[:id])
    @photo.delete
    #binding.pry
    redirect to '/photos'
  end

end
