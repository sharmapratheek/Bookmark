require "test_helper"

class BookmarkTest < ActiveSupport::TestCase
	def setup
		@bookmark = Bookmark.new(Bookmarkname: "B2" , link: "wwww,sample.com")		
	end

	test "Bookmark should be present" do 
		assert @bookmark.valid?
	end

	test "BookmarkName should be present" do
		@bookmark.Bookmarkname = " "
		assert_not @bookmark.valid?
	end

	test "Link should be present" do 
		@bookmark.link =  " "
		assert_not @bookmark.valid?
	end

	test "BookmarkName should be lesser than 30" do 
		@bookmark.Bookmarkname = "a" * 31
		assert_not @bookmark.valid?
	end

	test "Link should be lesser than 150" do 
		@bookmark.link = 'a' * 151
		assert_not @bookmark.valid?
	end
end