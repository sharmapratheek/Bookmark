class Bookmark < ApplicationRecord
	validates :Bookmarkname, presence: true ,length: {maximum: 30}
	validates :link,presence: true,length: {maximum: 150}

	belongs_to :user
	validates :user_id, presence: true
	has_many :bookmark_links
	has_many :links, through: :bookmark_links
end