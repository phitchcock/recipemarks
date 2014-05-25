class BookmarksController < ApplicationController

  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    @bookmarks = Bookmark.all 
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @bookmark, notice: "#{@bookmark.name} was created!"
    else
      flash[:error] = "Bookmark was not created, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @bookmark.save(bookmark_params)
      redirect_to @bookmark, notice: "#{@bookmark.name} was updated!"
    else
      flash[:error] = "Bookmark was not updated, please try again"
      render :edit
    end
  end

  def destroy
    if @bookmark.destroy
      redirect_to bookmarks_path, notice: "#{@bookmark.name} was destroyed!"
    else
      flash[:error] = "Bookmarks was not destroyed, please try again"
      redirect_to @bookmark
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit!
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end