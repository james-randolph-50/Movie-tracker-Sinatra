require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      set :session_secret, "secret"
    end

    get "/" do
      
        erb :index
    end

    helpers do
      def logged_in?
        !!current_user
      end

      def current_user
        binding.pry
        @current_user ||= User.find_by(id: sessions[:user_id]) if session [:user_id]
        
      end
    end

end
