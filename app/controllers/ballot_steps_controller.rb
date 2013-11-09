class BallotStepsController < ApplicationController
  include Wicked::Wizard
  steps :official_ballot_copy
  
  before_action :set_ballot
  
  def show
    render_wizard
  end
  
  def update
    @ballot.attributes = ballot_params
    render_wizard @ballot
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballot
        @ballot = Ballot.find(params[:ballot_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ballot_params
      params.require(:ballot).permit(:election_date, :state, :county, :city, :ward, :precinct, :officialBallot, :ballotColumns, :voter_id)
    end
    
end
