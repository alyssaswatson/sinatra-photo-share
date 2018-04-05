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
    if logged_in?
      @photo = Photo.find_by_id(params[:id])
      erb :'photos/show'
    else
      redirect to '/login'
    end
  end

  get '/photos/:id/edit' do

    if logged_in?
      @photo = Photo.find_by_id(params[:id])
      if @photo && @photo.user == current_user
        erb :'photos/edit'
      else
        redirect to '/photos'
      end
    else
      redirect to '/login'
    end

  end

  patch '/photos/:id' do
    if params[:link] != "" && params[:content] != ""
      @photo = Photo.find_by_id(params[:id])
      @photo.link = params[:link]
      @photo.caption = params[:caption]
      @photo.save
      redirect to "/photos/#{@photo.id}"
    else
      redirect to '/photos'
    end
  end

  delete '/photos/:id/delete' do
    @photo = Photo.find_by_id(params[:id])
    if @photo.user == current_user
      @photo.delete
    else
      redirect to '/photos'
    end
  end
end
