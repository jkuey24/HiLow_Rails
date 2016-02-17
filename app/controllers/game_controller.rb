class GameController < ApplicationController

  def try
    #determining if there is a number value for cookie
    if !session.has_key?(:number)
      #if there is no number assigned to cookie, then a random number between 1 and 100 will be assigned to cookies
      session[:number] = rand(1..100)
    end
    #instance variable created to guess and converted into an integer
    @guess = params[:guess].to_i
    #instance variable created to secret number and converted into an integer
    @secret_number = session[:number].to_i
    #if the secret number is equal to guess, then you win the game

    if @secret_number == @guess
      @result = "YOU WIN"
      #if you win, cookies are deleted and a new random number is generated
      session.delete :number
    #if the secret number is greater than the guess, "too low" is displayed

    elsif @secret_number > @guess
      @result = "TOO LOW"
    #if the secret number is less than the guess, "too low" is displayed

    else
      @result = "TOO HIGH"

    end #end of if statement

  end #end of method try

end #end of the class GameController
