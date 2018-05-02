require 'pry'

class MoviesController < ApplicationController
  
  get '/movies' do
   
   redirect_if_not_logged_in
    @movies = Movie.all
    
    erb :'/movies/index'
  end
  
  get '/movies/new' do
    redirect_if_not_logged_in
    erb :'/movies/new'
  end
  
  get '/movies/:slug' do
    redirect_if_not_logged_in
    @movie = Movie.find_by_slug(params[:slug])
    
    erb :'movies/show'
  end
  
  post '/movies' do
    @movie = Movie.create(:name => params["Movie_Name"], :slug => params["UserId"])
    @movie.save
    
    redirect("/movies/#{@movie.slug}")
  end
  
end