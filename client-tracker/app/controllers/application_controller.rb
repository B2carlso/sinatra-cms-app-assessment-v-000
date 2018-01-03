require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "trainerlife"
  end

  get "/" do
    erb :index
  end

  helpers do
    def redirect_if_not_logged_in
     if !logged_in?
       redirect "/login?error=You have to be logged in to do that"
     end
   end

     def logged_in?

      !!session[:trainer_id]
     end

     def current_user
       Trainer.find_by(id: session[:trainer_id]) if session[:trainer_id]
     end
   end
end
