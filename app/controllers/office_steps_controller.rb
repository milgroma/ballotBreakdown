class OfficeStepsController < ApplicationController
  include Wicked::Wizard
  steps :first_office_name
  
  before_action :set_ballot, :set_office
  
  def show
    render_wizard
  end
  
  def update
    @office.attributes = office_params
    render_wizard @office
  end
  
  def finish_wizard_path
    new_politician_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballot
      unless @ballot.nil?
        @ballot
      else
        @ballot = Ballot.find(params[:ballot_id])
      end
    end
    
    def set_office
      unless @office.nil?
        @office
      else
        @office = Office.find(params[:office_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_params
      params.require(:office).permit(:ballot_id, :tier, :office, :district, :territory, :term_limit, :terms, :ballotColumn)
    end
    
end
