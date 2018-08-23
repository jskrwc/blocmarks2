class LikesController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark was liked"
    else
      flash.now[:alert] = "There was an error liking this bookmark -- please try again"
    end

    # raise request.referrer.inspect
    redirect_back fallback_location: request.referrer
  end

  def destroy
    # Get the bookmark from the params
    # Find the current user's like with the ID in the params
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Bookmark was unliked"
    else
      flash.now[:alert] = "There was an error unliking this bookmark -- please try again"
    end

    redirect_back fallback_location: request.referrer
  end

end
