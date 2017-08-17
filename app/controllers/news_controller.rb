class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy, :vote, :dislike]
  before_action :set_congress
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :js, :json
  layout "insideapplication"
  # GET /news
  # GET /news.json
  def index
    @news = News.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)
    @news.congress = @congress
    respond_to do |format|
      if @news.save
        format.html { redirect_to [@news.congress, @news], notice: 'Noticia creada!!.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to [@news.congress, @news], notice: 'Actualización realizada.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to @congress, notice: 'Se destruyó la noticia' }
      format.json { head :no_content }
    end
  end

  def vote
    if !current_user.liked? @news
      @news.liked_by current_user
    elsif current_user.liked? @news
      @news.unliked_by current_user
    end

    respond_to do |f|
      f.js       
    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.

    def set_congress
      @congress = Congress.find(params[:congress_id])
    end

    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :image, :content, :author_id, :picture, :youtube_link)
    end

  end