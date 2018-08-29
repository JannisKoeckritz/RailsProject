require 'pp'
require_relative 'user'

user = User.new("Jana", "j@ana.com")

pp user

user.save