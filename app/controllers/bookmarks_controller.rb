class BookmarksController < ApplicationController
    def new
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new
        @movies = Movie.all
    end

    def create
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new(bookmark_params)
        
        if @bookmark.save
            raise
            redirect_to list_path(@list), notice: "Bookmark created"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @bookmark.destroy
        redirect_to bookmarks_url, notice: "Bookmark was successfully destroyed.", status: :see_other
      end

    private

    def bookmark_params
        params.require(:bookmark).permit(:comment, :movie_id)
    end
end
