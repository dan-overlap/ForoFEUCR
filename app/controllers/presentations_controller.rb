class PresentationsController < ApplicationController
  before_action :set_presentation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_congress, :set_category, :set_users
  respond_to :js, :html, :json
  layout "insideapplication"
  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.all
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    @comment = Comment.new
    @reply = Comment.new
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)
    @presentation.category = @category
    @presentation.uploader_id = current_user.id
    respond_to do |format|
      if @presentation.save
        format.html { redirect_to [@congress, @category , @presentation], notice: 'Presentation was successfully created.' }
        format.json { render :show, status: :created, location: @presentation }
      else
        format.html { render :new }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to [@congress, @category , @presentation], notice: 'Presentation was successfully updated.' }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to congress_category_presentations_url, notice: 'Presentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      if params.has_key?(:presentation_id)
              @presentation = Presentation.find(params[:presentation_id])
      else
        @presentation = Presentation.find(params[:id])
      end

    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_congress
      @congress = Congress.find(params[:congress_id])
    end

    def set_parent
      @comment.parent_id = params[:parent_id]
      respond_to do |f|
        f.js       
      end
    end

    def set_users
      @users = User.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.require(:presentation).permit(:title,:uploader, :abstract, :document, :status, :discussion_id, :likes_id, :dislikes_id, :pdf_file, :presenter, :presenter_name, :position, {:author_ids => []})
    end
end
