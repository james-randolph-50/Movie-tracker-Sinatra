require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  enable :sessions

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      set :session_secret, "secret"
    end

    get "/" do
        erb :layout
    end

    helpers do
      def logged_in?
        !!current_user
      end

      def current_user
        
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        
        
      end
    end

end
