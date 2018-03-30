class MoviesController < ApplicationController
  
  get '/movies' do
    @movies = Movie.all
    erb :'/movies/index'
  end
  
  get '/movies/new' do
    erb :'/movies/new'
  end
  
  get '/movies/:slug' do
    @movie = Movie.find_by_slug(params[:slug])
    
    erb :'movies/show'
  end
  
  post '/movies' do
    @movie = Movie.create(:name => params["Name"])
    @movie.genre_ids = params[:genres]
    @movie.save
    
    redirect("/movies/#{@movie.slug}")
  end
  
  