class OfficesController < ApplicationController
  before_action :set_office, only: [:show, :edit, :update, :destroy]
  before_action :set_ballot, only: [:show, :edit, :create, :update, :destroy]
  before_action :set_ballotColumn, only: [:another_new]
  before_filter :authenticate_voter!, except: [:index, :show]

  # GET /offices
  # GET /offices.json
  def index
    @offices = Office.all
  end

  # GET /offices/1
  # GET /offices/1.json
  def show
  end

  # GET /offices/new
  def new
    @office = Office.new
  end
  
  # GET /offices/another_new
  def another_new
    @office = Office.new
  end

  # GET /offices/1/edit
  def edit
  end

  # POST /offices
  # POST /offices.json
  def create
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        #session[:office_id] = @office.id
        #session[:ballotColumn] = @office.ballotColumn
        format.html { redirect_to voter_ballot_office_steps_path(office_id: @office.id, ballot_id: params[:office][:ballot_id], voter_id: params[:office][:voter_id]) }
        format.json { render action: 'show', status: :created, location: @office }
      else
        format.html { render action: 'new' }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1
  # PATCH/PUT /offices/1.json
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to @office, notice: 'Office was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.json
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to offices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    end
    
    def set_ballot
      unless @ballot.nil?
        @ballot
      else
        @ballot_id = params[:office][:ballot_ids].present? ? params[:office][:ballot_ids] : params[:office][:ballot_id]
        @ballot = Ballot.find(@ballot_id)
      end
    end
    
    def set_ballotColumn
      @ballotColumn = params[:ballotColumn]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_params
      params.require(:office).permit(:ballot_id, :ballot_ids, :tier, :office, :district, :territory, :term_limit, :terms, :ballotColumn, :voter_id, :office_id)
    end
end
