class BookmarksController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @topic = @bookmark.topic
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    @topic = Topic.find(params[:topic_id])
    @bookmark.topic = @topic
    @bookmark.user = current_user

    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark has been saved"
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error creating the bookmark -- Please try again"
      render :new
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    # @bookmark.url = params[:bookmark][:url]
    @bookmark.assign_attributes(bookmark_params)
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "The Bookmark has been updated"
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error updating the bookmark -- Please try again"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "There was an error deleting the bookmark.  Please try again."
      render :show
    end

  end

  private

  def bookmark_params
    params.required(:bookmark).permit(:url)
  end
end
