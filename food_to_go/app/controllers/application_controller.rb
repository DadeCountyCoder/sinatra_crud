require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    # set :session_secret. 'secret'
  end

  get "/users" do
     erb :welcome
    "Hello World this is my user page"
  end

end
