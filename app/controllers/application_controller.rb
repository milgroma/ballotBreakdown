class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_voter!
  
  def welcome
    redirect_to voter_ballots_path(current_voter)
  end  
  
end
