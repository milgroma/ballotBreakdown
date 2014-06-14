class BallotsController < ApplicationController
  before_action :set_ballot, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_voter!
  
  # GET /ballots
  # GET /ballots.json
  def index
    @ballots = Ballot.where voter_id: params[:voter_id]
    @last_ballot = Ballot.where(voter_id: params[:voter_id]).last
    @old_ballots = Ballot.where(voter_id: params[:voter_id]).where.not(id: @last_ballot.id).order('ballots.created_at DESC')
  end

  # GET /ballots/1
  # GET /ballots/1.json
  def show
  end

  # GET /ballots/new
  def new
    @ballot = Ballot.new
  end

  # GET /ballots/1/edit
  def edit
  end

  # POST /ballots
  # POST /ballots.json
  def create
    @ballot = Ballot.new(ballot_params)

    respond_to do |format|
      if @ballot.save
        #session[:ballot_id] = @ballot.id
        format.html { redirect_to voter_ballot_steps_path(voter_id: params[:ballot][:voter_id]) }
        format.json { render action: 'show', status: :created, location: @ballot }
      else
        format.html { render action: 'new' }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ballots/1
  # PATCH/PUT /ballots/1.json
  def update
    respond_to do |format|
      if @ballot.update(ballot_params)
        format.html { redirect_to @ballot, notice: 'Ballot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ballots/1
  # DELETE /ballots/1.json
  def destroy
    @ballot.destroy
    respond_to do |format|
      format.html { redirect_to ballots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballot
      @ballot = Ballot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ballot_params
      params.require(:ballot).permit(:election_date, :state, :county, :city, :ward, :precinct, :officialBallot, :ballotColumns, :voter_id)
    end
end
