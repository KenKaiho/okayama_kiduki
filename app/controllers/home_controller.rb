class HomeController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  # GET /information
  # GET /information.json
  def index
    @imap = {}
    @informations = Information.order("id DESC").page(params[:page])
#    @informations = Information.all.order("id DESC")
    @informations.each do |information|
      sql="select * from awarenesses left join awarenesses_has_informations on awarenesses_id=id where information_id=?"
      awareness=Awareness.find_by_sql([sql,information.id])
      @imap.store(information.id,awareness)
    end

    retreve_awareness_sql="SELECT a.id, a.title, COUNT(c.good) + COUNT(c.bad) as evaluation FROM awarenesses a INNER JOIN comments c on a.id = c.awareness_id GROUP BY a.id ORDER BY evaluation DESC;"
    @awareness_evaluation=Awareness.find_by_sql(retreve_awareness_sql)
  end

  # GET /information/1
  # GET /information/1.json
  def show
  end

  # GET /information/new
  def new
    @information = Information.new
  end

  # GET /information/1/edit
  def edit
  end

  # POST /information
  # POST /information.json
  def create
    @information = Information.new(information_params)

    respond_to do |format|
      if @information.save
        format.html { redirect_to controller: 'home', action: 'index', notice: 'Information was successfully created.' }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information/1
  # PATCH/PUT /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to @information, notice: 'Information was successfully updated.' }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1
  # DELETE /information/1.json
  def destroy
    @information.destroy
    respond_to do |format|
      format.html { redirect_to information_index_url, notice: 'Information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def information_params
      params.require(:information).permit(:title, :url, :comment, :insert_time, :update_time)
    end
end
