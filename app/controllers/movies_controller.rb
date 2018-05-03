
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
      @movie = Movie.find(params[:slug])
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
    @movie = Movie.create(:name => params["name"])
    
    @movie.save
    redirect("/movies/#{@movie.slug}")
  end
  

    
  
end