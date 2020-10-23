class UserController < ApplicationController
    
    get '/users/signup' do 
        # "this is the signup route"
        erb :'/users/signup'
    end


    post '/users/signup' do 

        if params[:username] == "" && params[:password] == ""
            redirect "/users/signup"
       
        #params[:username]
        #params[:password]
        #params.inspect 
        else
        @user = User.create(username: params[:username], password: params[:password])
        # binding.pry
       
        # if @user.username == "" && @user.password == ""
        #     redirect "/users/signup"
    
            #@user.save
            sessions[:user_id] = @user.id
            redirect "/users/#{@user.id}"
            #was redirect_to
        #creates user object
        # end
        end
    end

    get '/users/login' do
        #if user is logged in 
        #redirect to their home page
        #else, show them the login form
        if logged_in?
            @user = User.find(session[:user_id])
            redirect "/users/#{@user.id}"  
        else
        erb :'/users/login'
        end

    end


    post '/users/login' do
        #want to find user, if exists
      @user = User.find_by(username: params[:username])
      #authenticate password
      #if  params[:password] == @user.password
        #salt or encrypt your password
    #   end
      
    # end

    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
        #authenticate password
    else
        redirect "/users/login"
        #not vali
        #redirect to login
    end
end

    

    get '/users/:id/' do
        #"this is a show page"
        @user = User.find(params[:id]) 
        #binding.pry
        erb :'/users/show'
    end
        #showpage

    get '/users/logout' do 
        sessions.clear
        redirect '/users/login'
    end


# sessions = {}
# sessions[:key] = value
end