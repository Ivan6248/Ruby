require 'sinatra'
require 'sinatra/reloader'

get '/' do 
	randomNum = rand(100)
	"THE SECRET NUMBER IS #{randomNum}"
end