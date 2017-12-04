class PagesController < ApplicationController
	def home
		if logged_in?
			redirect_to bookmarks_path 
			
		end
	end
end