require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(10)
@@guesses = 5
correct = false

get '/' do 
	message = check_guess(params["guess"])
	bg_color = color_picker message

	if @@guesses == 0 && !correct
		message = "Sorry, you have lost. Try again!"
		@@guesses = 5
		SECRET_NUMBER = rand(100)
	elsif correct 
		SECRET_NUMBER = rand(100)
		@@guesses = 5
		correct = false
	else
		@@guesses -= 1
	end

	erb :index, :locals => {:message =>message, :guesses => @@guesses, :bg_color => bg_color}
end

def check_guess(guess)
	if guess.nil?
		@@guesses = 6
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
			correct = true
			return "You got it right!"
		end
	end
end

def color_picker(message)
	case message 
	when "Pick a number 1-100" then "#FFFFFF"
	when "Way too high!" then "#FF9473" 
	when "Way too Low!"  then "#FF9473"
	when "Too high!" then "#FF9473"
	when "Too Low!" then "#FF9473"
	when "Sorry, you have lost. Try again!" then "red"
	when "You got it right!" then "#62D99C"
	end
end



