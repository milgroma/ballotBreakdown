class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show, :edit, :update, :destroy]
  before_action :set_office, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_voter!, except: [:index, :show]

  # GET /politicians
  # GET /politicians.json
  def index
    @politicians = Politician.all
  end

  # GET /politicians/1
  # GET /politicians/1.json
  def show
  end

  # GET /politicians/new
  def new
    @politician = Politician.new
  end

  # GET /politicians/1/edit
  def edit
  end

  # POST /politicians
  # POST /politicians.json
  def create
    @politician = Politician.new(politician_params)

    respond_to do |format|
      if @politician.save
        unless params[:next_office]
          format.html { redirect_to new_politician_path, notice: 'Politician was successfully created.' }
          format.json { render action: 'show', status: :created, location: @politician }
        else
          format.html { redirect_to another_new_offices_path, notice: 'Politician was successfully created.' }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /politicians/1
  # PATCH/PUT /politicians/1.json
  def update
    respond_to do |format|
      if @politician.update(politician_params)
        format.html { redirect_to @politician, notice: 'Politician was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /politicians/1
  # DELETE /politicians/1.json
  def destroy
    @politician.destroy
    respond_to do |format|
      format.html { redirect_to politicians_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      @politician = Politician.find(params[:id])
    end
    
    def set_office
      unless @office.nil?
        @office
      else
        @office = Office.find(session[:office_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def politician_params
      params.require(:politician).permit(:office_ids, :name, :party)
    end
end
