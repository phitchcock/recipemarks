class BookmarksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic
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
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic

    if @bookmark.save
      redirect_to @topic, notice: "#{@bookmark.name} was created!"
    else
      flash.now[:error] = "Bookmark was not created, please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to [@topic, @bookmark], notice: "#{@bookmark.name} was updated!"
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

  def set_topic
    @topic = Topic.friendly.find(params[:topic_id])
  end
end