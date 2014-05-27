class UsersController < ApplicationController

  def show
    @user = current_user
    #@topic = Topic.friendly.find(params[:id])
    @bookmarks = current_user.bookmarks.paginate(:page => params[:page], :per_page => 2)
  end

  def update
  end

end