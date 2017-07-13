class CongressesController < ApplicationController
  before_action :set_congress, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_params, only: [:toggleDefault,:admin]
  before_action :authenticate_user!, except: [:show, :default]
  before_action :check_elevation, only: [:index, :set_admin_params,:admin, :toggleDefault, :adminToggle]
  layout "congresses"
  # GET /congresses
  # GET /congresses.json

  def index
    @congresses = Congress.all
  end

  def category_path
    congress_category_path
  end

  # GET /congresses/1
  # GET /congresses/1.json
  def show
   render layout: 'insideapplication'
   @news = @congress.news
  end
 # GET /congresses/admin 
  def admin
    render layout: 'insideapplication'
  end

  # GET /congresses/new
  def new
    @congress = Congress.new
    @users = User.all
  end

  def check_elevation
    redirect_to root_path, notice: 'Necesita permisos especiales para realizar esta acción.' unless current_user.admin? 
  end

  # GET /congresses/1/edit
  def edit
    @users = User.all
  end

  def adminToggle
    @user = User.find(params[:user_id])
    puts @user.username
    @user.update_attributes(:admin => !@user.admin?)
    @user.save
    puts @user.errors.full_messages
    # ... update successful

  end

  def default
    if Congress.any?
      default = Congress.find_by(:default => true)
        if(default != nil)
          redirect_to Congress.find_by(:default => true)
        else
          redirect_to congresses_path
        end
    else
      redirect_to congresses_path
    end
  end

  def toggleDefault
    puts @congress.name
    if(!@congress.default?)
      default = Congress.find_by(:default => true)
      if(default != nil)
        default.update_attributes(:default => false)
      end
    end
    @congress.update_attributes(:default => !@congress.default?)
    puts @congress.errors.full_messages
    # ... update successful

  end

  # POST /congresses
  # POST /congresses.json
  def create

    @congress = Congress.new(congress_params)
    @congress.responsible_id = current_user.id
    respond_to do |format|
      if @congress.save
        format.html { redirect_to @congress, notice: 'Congress was successfully created.' }
        format.json { render :show, status: :created, location: @congress }
      else
        format.html { render :new }
        format.json { render json: @congress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /congresses/1
  # PATCH/PUT /congresses/1.json
  def update
    respond_to do |format|
      if @congress.update(congress_params)
        format.html { redirect_to @congress, notice: 'Congress was successfully updated.' }
        format.json { render :show, status: :ok, location: @congress }
      else
        format.html { render :edit }
        format.json { render json: @congress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /congresses/1
  # DELETE /congresses/1.json
  def destroy
    @congress.destroy
    respond_to do |format|
      format.html { redirect_to congresses_url, notice: 'Congress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_congress
      @congress = Congress.find(params[:id])
    end

    def set_admin_params
      @congress = Congress.find(params[:congress_id])
      @users = User.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def congress_params
      params.require(:congress).permit(:name, :description, :categories_id, :facebook_dir, :twitter_dir,:favicon, :logo,:color,  :administrator_ids => [])
    end
end
