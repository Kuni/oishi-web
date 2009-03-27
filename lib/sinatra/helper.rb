module Sinatra

  # usage:
  #    
  #   authorize! => redirect to /login
  #   authorize!("/auth") => redirect to /auth

	module SessionAuth

		def authorized?
			session[:authorized]
		end

		def authorize!(path)
      path ||= "/login"
	    redirect path unless authorized?
		end

		def logout!
			session[:authorized] = false
		end

  end

  module Geokit
    
    def getLatitudeLongitude(address)
      require "geokit" unless ::Geokit

    end

  end


end