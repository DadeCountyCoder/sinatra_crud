class UserController < ApplicationController
    
    get '/users/signup' do 
        # "this is the signup route"
        erb :'/users/signup'
    end


    post '/users/signup' do 
        #params[:username]
        #params[:password]
        #params.inspect
        @user = User.create(username: params[:username], password: params[:password])
        # binding.pry
        sessions[:user_id] = @user.id
        redirect "/users/#{@user.id}"

    end

    get '/users/login' do
        #if user is logged in 
        #redirect to their home page
        #else, show them the login form
        erb :'/users/login'

    end


    post '/users/login' do
        #want to find user, if exists
      @user = User.find_by(username: params[:username])
      #authenticate password
      if  params[:password] == @user.password
      
    end

    

    get '/users/:id/' do
        #"this is a show page"
        @user = User.find(params[:id]) 
        #binding.pry
        erb :'/users/show'
    end
        #showpage

end


# sessions = {}
# sessions[:key] = value