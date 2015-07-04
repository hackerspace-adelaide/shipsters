class VoyagesController < ApplicationController
  load_and_authorize_resource
  before_action :set_voyage, only: [:show, :edit, :update, :destroy]

  # GET /voyages
  # GET /voyages.json
  def index
    @voyages = Voyage.all
  end

  # GET /voyages/1
  # GET /voyages/1.json
  def show
  end

  # GET /voyages/new
  def new
    @voyage = Voyage.new
    @ships = Ship.all
  end

  # GET /voyages/1/edit
  def edit
  end

  # POST /voyages
  # POST /voyages.json
  def create
    @voyage = Voyage.new(voyage_params)

    respond_to do |format|
      if @voyage.save
        format.html { redirect_to @voyage, notice: 'Voyage was successfully created.' }
        format.json { render :show, status: :created, location: @voyage }
      else
        format.html { render :new }
        format.json { render json: @voyage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voyages/1
  # PATCH/PUT /voyages/1.json
  def update
    respond_to do |format|
      if @voyage.update(voyage_params)
        format.html { redirect_to @voyage, notice: 'Voyage was successfully updated.' }
        format.json { render :show, status: :ok, location: @voyage }
      else
        format.html { render :edit }
        format.json { render json: @voyage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voyages/1
  # DELETE /voyages/1.json
  def destroy
    @voyage.destroy
    respond_to do |format|
      format.html { redirect_to voyages_url, notice: 'Voyage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voyage
      @voyage = Voyage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voyage_params
      params.require(:voyage).permit(:ship_id)
    end
end
