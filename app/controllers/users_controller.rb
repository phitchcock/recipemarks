class UsersController < ApplicationController

  def show
    @user = current_user
    #@topic = Topic.friendly.find(params[:id])
    #@bookmarks = @user.bookmarks.order('topic_id DESC').paginate(:page => params[:page], :per_page => 10)
    @bookmarks = @user.bookmarks
    #@tag = ActsAsTaggableOn::Tag.find(params[:id])
    #@bookmarks = @tag.user.bookmarks
  end

  def update
  end

end