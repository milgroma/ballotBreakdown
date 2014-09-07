class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def welcome
    
    x = Rails.application.routes.recognize_path(request.referrer)
    
    if x[:controller] == 'sessions' || x[:controller] == 'devise/registrations'
      redirect_to voter_ballots_path(voter_id: current_voter.id)
    else
      redirect_to info_index_path
    end
  end  
  
end
