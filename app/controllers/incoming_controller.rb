class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    # puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here. 
    # match_header('subject', '#')

    @user = User.find_by(email: params[:from])
    @bookmark = Bookmark.new(name: params[:subject], url: params['stripped-text'])
    @bookmark.user = @user
    if @bookmark.save
      # Assuming all went well. 
      head 200
    else
      head 404
    end
  end
end