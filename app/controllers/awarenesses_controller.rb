class AwarenessesController < ApplicationController
  before_action :set_awareness, only: [:show, :edit, :update, :destroy]

  # GET /awarenesses
  # GET /awarenesses.json
  def index
    @awarenesses = Awareness.all
  end

  # GET /awarenesses/1
  # GET /awarenesses/1.json
  def show
  end

  # GET /awarenesses/new
  def new
    @awareness = Awareness.new
  end

  # GET /awarenesses/1/edit
  def edit
  end

  # POST /awarenesses
  # POST /awarenesses.json
  def create
    @awareness = Awareness.new(awareness_params)
    @awareness.insert_time=Time.now
    @awareness.update_time=Time.now
    respond_to do |format|
      if @awareness.save
        format.html { redirect_to @awareness, notice: '気づきが正常に登録されました' }
        format.json { render :show, status: :created, location: @awareness }
        
        @awarenesses_has_information = AwarenessesHasInformation.new(awarenesses_id:@awareness.id,information_id:params[:awareness][:information_id])
        @awarenesses_has_information.save 

     else
        format.html { render :new }
        format.json { render json: @awareness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /awarenesses/1
  # PATCH/PUT /awarenesses/1.json
  def update
    respond_to do |format|
      @awareness.update_time=Time.now
      if @awareness.update(awareness_params)
        format.html { redirect_to @awareness, notice: 'Awareness was successfully updated.' }
        format.json { render :show, status: :ok, location: @awareness }
      else
        format.html { render :edit }
        format.json { render json: @awareness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awarenesses/1
  # DELETE /awarenesses/1.json
  def destroy
    @awareness.destroy
    respond_to do |format|
      format.html { redirect_to awarenesses_url, notice: 'Awareness was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_awareness
      @awareness = Awareness.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def awareness_params
      params.require(:awareness).permit(:title, :url, :meaning, :source, :insert_time, :update_time, :users_id)
    end
end
