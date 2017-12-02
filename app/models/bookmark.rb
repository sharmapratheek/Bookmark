class Bookmark < ApplicationRecord
	validates :Bookmarkname, presence: true ,length: {maximum: 30}
	validates :link,presence: true,length: {maximum: 150}
end