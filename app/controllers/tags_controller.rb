class TagsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  #before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    #binding.pry
    @tags = ActsAsTaggableOn::Tag.all
    #@bookmarks = Bookmark.all
  end

  # @tags.each do |tag|
  #   = link_to tag.name, tag
  #   tag.taggings.map(&:taggable).each do |bookmark|
  #     = link_to bookmark.name, bookmark

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    # @bookmarks = Bookmark.tagged_with(params[:id])
    #@bookmarks = @topic.bookmarks.tagged_with(params[:tag])
    #@bookmarks = @tag.bookmarks
   
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to @tag, notice: "#{@tag.name} was created!"
    else
      flash.now[:error] = "Topic was not created, please try again"
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit!
  end

end