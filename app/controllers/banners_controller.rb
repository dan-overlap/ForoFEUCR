class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]
  before_action :set_congress
  layout 'insideapplication'
  # GET /banners
  # GET /banners.json
  def index
    @banners = Banner.all
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
  end

  def set_congress
    @congress = Congress.find(params[:congress_id])
  end

  # GET /banners/new
  def new
    @banner = Banner.new
  end

  # GET /banners/1/edit
  def edit
  end

  # POST /banners
  # POST /banners.json
  def create
    @banner = Banner.new(banner_params)
    @banner.congress = @congress
    respond_to do |format|
      if @banner.save
        format.html { redirect_to congress_admin_path(@congress), notice: 'Imagen cargada con éxito.' }
        format.json { render :show, status: :created, location: @banner }
      else
        format.html { render :new }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banners/1
  # PATCH/PUT /banners/1.json
  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to congress_admin_path(@congress), notice: 'Banner was successfully updated.' }
        format.json { render :show, status: :ok, location: @banner }
      else
        format.html { render :edit }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to congress_admin_path(@congress), notice: 'Imagen eliminada con éxito' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def banner_params
      params.require(:banner).permit(:description, :image)
    end
end
