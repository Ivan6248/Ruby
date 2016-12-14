require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)
get '/' do 
	message = check_guess(params["guess"])
	erb :index, :locals => {:message =>message}
end

def check_guess(guess)
	if guess.nil?
		return "Pick a number 1-100"
	else
		if (guess.to_i > SECRET_NUMBER + 5)
			return "Way too high!"
		elsif (guess.to_i<SECRET_NUMBER - 5)
			return "Way too low!"
		elsif(guess.to_i>SECRET_NUMBER)
			return "Too high!"
		elsif (guess.to_i < SECRET_NUMBER)
			return "Too Low!"
		elsif (guess.to_i == SECRET_NUMBER)
			return "You got it right!"
		end
	end
end
