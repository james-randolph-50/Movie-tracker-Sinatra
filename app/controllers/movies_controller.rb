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
  
 get "/movies/:id/edit" do

    redirect_if_not_logged_in 
    @error_message = params[:error]
    
    if session[:user_id]
      @movie = Movie.find_by_slug(params[:id])
      erb :'movies/edit'
    else
      redirect to '/login'
    end
    
  end
  
  get '/movies/:slug' do
    redirect_if_not_logged_in
    @movie = Movie.find_by_slug(params[:slug])
    erb :'movies/show'
  end
  
  post '/movies' do
    redirect_if_not_logged_in
    @movie = Movie.create(:name => params["Movie_Name"])
    
    @movie.save
    redirect("/movies/#{@movie.slug}")
  end
  
  delete '/movies/:slug' do
    @movie = Movie.delete(params[:slug])
    redirect to("/")
  end
  
  
end