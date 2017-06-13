class CommentsController < ApplicationController
  before_action :set_comment, :set_replies, only: [:show, :edit, :update, :destroy]
  before_action :set_congress, :set_category, :set_presentation
  before_action :authenticate_user!, except: [:index, :show]
  respond_to
  layout "insideapplication"
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show

  end

  # GET /comments/new
  def new
    @comment = Comment.new(:parent_id => params[:parent_id])
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.presentation = @presentation
    #@comment.comment_id = 3
    respond_to  do |format|
      if @comment.save
        format.html { redirect_to  [@congress, @category, @presentation], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js 
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js 
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        @comment.presentation = @presentation
        format.html { redirect_to [@congress, @category, @presentation, @comment], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
        format.js {render layout: false}
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js {render layout: false}
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_congress
      @congress = Congress.find(params[:congress_id])
    end

    def set_replies
      @replies = Comment.all
    end

    def set_presentation
      @presentation = Presentation.find(params[:presentation_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :body, :comment_id, :parent_id)
    end
end
