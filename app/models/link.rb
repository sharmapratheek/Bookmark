class Link < ApplicationRecord
	validates :link ,presence: true ,length: {minimum: 3,maximum: 250}
	validates_uniqueness_of :link 

	has_many :bookmark_links
	has_many :bookmarks, through: :bookmark_links
end