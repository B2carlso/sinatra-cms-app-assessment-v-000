class TrainersController < ApplicationController

  get '/signup' do
     #binding.pry
      if !logged_in?
         erb :"/trainer/new"
       else
          redirect to '/show'
        end
    end

    post '/signup' do
      if params[:username] == "" || params[:email] == "" || params[:password] == ""
        redirect("/signup")
      else
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect("/show")
      end
    end

    get '/login' do
    if !logged_in?
      erb :'/trainer/login'
    else
      redirect("/show")
    end
  end

  post '/login' do
    @trainer = Trainer.find_by(username: params[:username])
    if @trainer && @trainer.authenticate(params[:password])
      session[:user_id] = @trainer.id
      redirect("/show")
    else
      redirect("/signup")
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect("/login")
    else
      redirect("/")
    end
  end

  end
