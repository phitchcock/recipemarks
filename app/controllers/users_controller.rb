class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks.paginate(:page => params[:page], :per_page => 2)
  end

  def update
  end

end