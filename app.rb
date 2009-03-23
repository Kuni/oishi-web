require "rubygems"
require "sinatra/base"
require "lib/sinatra/helper"
#require "lib/sequel/oishi"
require "haml"

# Adding Model Libraries
#   using require "lib/sequel/oishi"
#   add some methods

class App < Sinatra::Base

	helpers Sinatra::SessionAuth


  # main page

  get '/' do 
		%Q{
			Welcome to Sinatra
			<a href="/private">Chech Private Page</a>
		}
	end

  # login process
  get "/login" do
    # 顯示login page
    "Login page"
  end

  post "/login" do 
    # sample code
    # if User.authenticated?(params[:user], params[:password])
		#	  session[:authorized] = true
		#		redirect "/"
		#	else
		#		session[:authorized] = false
		#		redirect "/login"
		#	end
    "Accept Login form"
  end

	get '/logout' do 
		logout!
		redirect "/"
	end

  # sign up process
  
  get "/signup" do  
    "Sign up Page"
  end

  post "/signup" do 
    # write data to Database
    # send mail to user
    # login use this account
    # redirect to home page
  end





  # sample code
  #   redirect request.referrer



end


app = App.new
sessioned_app = Rack::Session::Pool.new(app,{})
Rack::Handler::WEBrick.run sessioned_app, :Port => 4567