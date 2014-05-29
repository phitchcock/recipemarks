class BookmarksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    #@bookmarks = Bookmark.tagged_with(params[:tag])
    @bookmarks = Bookmark.all
  end
   
  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: "#{@bookmark.name} was created!"
    else
      flash.now[:error] = "Bookmark was not created, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: "#{@bookmark.name} was updated!"
    else
      flash.now[:error] = "Bookmark was not updated, please try again"
      render :edit
    end
  end

  def destroy
    if @bookmark.destroy
      redirect_to user_path, notice: "#{@bookmark.name} was destroyed!"
    else
      flash[:error] = "Bookmarks was not destroyed, please try again"
      redirect_to user_path
    end
  end

  

  private

  def bookmark_params
    params.require(:bookmark).permit!
  end

  def set_bookmark
    @bookmark = Bookmark.friendly.find(params[:id])
  end

end