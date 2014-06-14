class BallotStepsController < ApplicationController
  include Wicked::Wizard
  steps :official_ballot_copy, :where_you_vote, :ballot_steps
  
  before_action :set_ballot
  
  def show
    render_wizard
  end
  
  def update
    @ballot.attributes = ballot_params
    render_wizard @ballot
  end
  
  def finish_wizard_path
    new_voter_ballot_office_path(ballot_id: @ballot.id)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballot
      unless @ballot.nil?
        @ballot
      else
        @ballot = Ballot.find(session[:ballot_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ballot_params
      params.require(:ballot).permit(:election_date, :state, :county, :city, :ward, :precinct, :officialBallot, :ballotColumns, :voter_id, :ballot_id)
    end
    
end
