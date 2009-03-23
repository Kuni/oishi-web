require "sequel"
require "logger"
require "digest/md5"

DB = Sequel.sqlite("db/oishi.db")


class User < Sequel::Model
	
	def self.authenticated?(email, password)
		user = User.filter(:email => email).first
		return false unless user
		user.password == Digest::MD5.hexdigest(password) ? true : false
	end


end