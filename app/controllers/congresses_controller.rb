class CongressesController < ApplicationController
  before_action :set_congress, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
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

  # GET /congresses/new
  def new
    @congress = Congress.new
    @users = User.all
  end

  # GET /congresses/1/edit
  def edit
    @users = User.all
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def congress_params
      params.require(:congress).permit(:name, :organizer, :responsible_id , :calendar_id, :blog_id, :categories_id, :facebook_dir, :twitter_dir, :administrator_ids => [])
    end
end
