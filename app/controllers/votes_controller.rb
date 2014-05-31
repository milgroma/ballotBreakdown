class VotesController < ApplicationController
  before_action :set_ballot, only: [:show, :easy_votes, :undecided_votes, :where_was_i, :edit, :update]
  before_action :set_vote, only: [:show, :edit, :update]
  before_action :setup_votes, only: [:easy_votes, :undecided_votes, :where_was_i]

  
  # GET /voter/1/votes/1/easy_votes
  # GET /voter/1/votes/1/easy_votes.json
  def easy_votes
  end
  
  # GET /voter/1/votes/1/undecided_votes
  # GET /voter/1/votes/1/undecided_votes.json
  def undecided_votes
  end
  
  # GET /voter/1/votes/1/where_was_i
  # GET /voter/1/votes/1/where_was_i.json
  def where_was_i
  end
  
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        @votes = Vote.where :ballot_id => vote_params[:ballot_id]
        @politician = Politician.find(vote_params[:politician_id])
        @office = Office.find(vote_params[:office_id])
        @ballot = Ballot.find(vote_params[:ballot_id])
        format.html { render partial: 'votes/create_or_destroy_politician_vote', content_type: "text/html", locals: {politician: @politician, office: @office, ballot: @ballot} }

        #format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @vote }
      else
        format.html { render action: 'new' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    respond_to do |format|
      @votes = Vote.where :ballot_id => params[:ballot_id]
      @politician = Politician.find(params[:politician_id])
      @office = Office.find(params[:office_id])
      @ballot = Ballot.find(params[:ballot_id])
      format.html { render partial: 'votes/create_or_destroy_politician_vote', content_type: "text/html", locals: {politician: @politician, office: @office, ballot: @ballot} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end
    
    def setup_votes
      @vote = Vote.new
      @votes = Vote.where :ballot_id => @ballot.id
    end
    
    def set_ballot
      unless @ballot.nil?
        @ballot
      else
        @ballot = Ballot.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:voter_id, :ballot_id, :office_id, :politician_id, :id)
    end
end
