class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.movie = Movie.find(params[:movie_id])
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
end
