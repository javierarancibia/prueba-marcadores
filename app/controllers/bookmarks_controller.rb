class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmark = Bookmark.new
    @types = Type.all
    @type = Type.new
    @q = Bookmark.ransack(params[:q])
    @bookmarks = @q.result(distinct: true)

    @types_graphic = Type.group(:theme).count()
    @bookmarks_graphic = Bookmark.group(:category).count()
  end

  def get_api
    @bookmarks = Bookmark.all
    render json: @bookmarks
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'El marcador fue creado con exito.' }
        format.js { @bookmark }
      else
        format.html { render :new }
        format.js { render :index }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.js { @bookmark }
      else
        format.html { render :edit }
        format.js { render :index }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.' }
      format.js { @bookmark }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bookmark_params
      params.require(:bookmark).permit(:category, :url, :status)
    end
    def type_params
      params.require(:type).permit(:theme, :link, :bookmark_id)
    end
    # def select_bookmark
    #   @bookmark_find = Bookmark.all.pluck(:category, :id)
    # end
end
