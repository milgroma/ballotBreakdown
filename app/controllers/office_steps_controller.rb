class OfficeStepsController < ApplicationController
  include Wicked::Wizard
  steps :first_office_name
  
  #before_action :set_ballot, :set_office
  
  def show
    if params[:office_id].present?
      @office = Office.find(params[:office_id])
    elsif params[:office].present?
      @office = Office.find(params[:office][:office_id])
    end
    render_wizard
  end
  
  def update
    @office = Office.find(params[:office][:office_id])
    @office.attributes = office_params
    render_wizard @office
  end
  
  def finish_wizard_path
    new_voter_ballot_politician_path
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def office_params
      params.require(:office).permit(:ballot_id, :office_id, :tier, :office, :district, :territory, :simultaneousSeatholders, :term_limit, :terms, :ballotColumn)
    end
    
end
