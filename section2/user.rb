require 'json'
class User
	attr_accessor :name, :email, :permissions

  def initialize(*args)
  	@name = args[0]
  	@email = args[1]
  	@permissions = User.permissions_from_json
  end

  def self.permissions_from_json
  	file = File.read 'users_permissions.json'
  	JSON.load(file, symbolize_names: true)
  end

  def save
  	self_json = {email: @email, name: @name, permissions: @permissions}.to_json
    open('user.json','a') do |file|
    	file.puts self_json
    end
  end
end