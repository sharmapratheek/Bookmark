class BookmarksController < ApplicationController
	before_action :set_bookmark, only: [:edit,:update,:destroy,:show]

	def index
		@bookmarks = Bookmark.all
	end

	def new
		@bookmark = Bookmark.new
	end

	def create 
		@bookmark = Bookmark.new(bookmark_params)
		if @bookmark.save
			flash[:notice] = "Bookmark was successully created"
			redirect_to bookmark_path(@bookmark)
		else 
			render "new"
		end
	end

	def show 

	end

	def edit
		
	end

	def update
		
		if @bookmark.update(bookmark_params)
			flash[:notice] = "Bookmark has been updated "
			redirect_to bookmark_path
		else
			render "edit"
		end
	end

	def destroy
		if @bookmark.destroy
			flash[:notice] = "Bookmark was deleted successfully"
			redirect_to bookmarks_path
		else 
			render "show"
		end
	end

	private

	def bookmark_params
		params.require(:bookmark).permit(:Bookmarkname , :link)
	end
	def set_bookmark
		@bookmark = Bookmark.find(params[:id])
	end
end