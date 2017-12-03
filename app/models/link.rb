class Link < ApplicationRecord
	validates :link ,presence: true ,length: {minimum: 3,maximum: 250}
	validates_uniqueness_of :link 

	has_many :bookmark_links
	has_many :bookmark, through: :bookmark_links
end