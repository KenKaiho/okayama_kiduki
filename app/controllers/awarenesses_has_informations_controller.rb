class AwarenessesHasInformationsController < ApplicationController
  before_action :set_awarenesses_has_information, only: [:show, :edit, :update, :destroy]

  # GET /awarenesses_has_informations
  # GET /awarenesses_has_informations.json
  def index
    @awarenesses_has_informations = AwarenessesHasInformation.all
  end

  # GET /awarenesses_has_informations/1
  # GET /awarenesses_has_informations/1.json
  def show
  end

  # GET /awarenesses_has_informations/new
  def new
    @awarenesses_has_information = AwarenessesHasInformation.new
  end

  # GET /awarenesses_has_informations/1/edit
  def edit
  end

  # POST /awarenesses_has_informations
  # POST /awarenesses_has_informations.json
  def create
    @awarenesses_has_information = AwarenessesHasInformation.new(awarenesses_has_information_params)

    respond_to do |format|
      if @awarenesses_has_information.save
        format.html { redirect_to @awarenesses_has_information, notice: 'Awarenesses has information was successfully created.' }
        format.json { render :show, status: :created, location: @awarenesses_has_information }
      else
        format.html { render :new }
        format.json { render json: @awarenesses_has_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /awarenesses_has_informations/1
  # PATCH/PUT /awarenesses_has_informations/1.json
  def update
    respond_to do |format|
      if @awarenesses_has_information.update(awarenesses_has_information_params)
        format.html { redirect_to @awarenesses_has_information, notice: 'Awarenesses has information was successfully updated.' }
        format.json { render :show, status: :ok, location: @awarenesses_has_information }
      else
        format.html { render :edit }
        format.json { render json: @awarenesses_has_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awarenesses_has_informations/1
  # DELETE /awarenesses_has_informations/1.json
  def destroy
    @awarenesses_has_information.destroy
    respond_to do |format|
      format.html { redirect_to awarenesses_has_informations_url, notice: 'Awarenesses has information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_awarenesses_has_information
      @awarenesses_has_information = AwarenessesHasInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def awarenesses_has_information_params
      params.require(:awarenesses_has_information).permit( :information_id , :awareness_id)
    end
end
