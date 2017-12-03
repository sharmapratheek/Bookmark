class BookmarkLink < ApplicationRecord
	belongs_to :link 
	belongs_to :bookmark 
end