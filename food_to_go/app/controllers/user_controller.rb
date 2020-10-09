class UserController < ApplicationController
    
    get '/users/signup' do 
        # "this is the signup route"
        erb :'/users/signup'
    end


end