require "test_helper"

class BookmarksTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(name: "NameUser" , email: "username@email.com",
							password: "password",password_confirmation: "password")
		@bookmark = @user.bookmarks.build(Bookmarkname: "B5" , link: "www.sample88.com")
		@bookmark.save  
	end

	test "should get bookmarks index" do 
		get bookmarks_path
		assert_response :success				
	end

	test "should  get bookmarks listings" do 
		get bookmarks_path
		assert_template "bookmarks/index"		
		assert_select "a[href=?]" ,bookmark_path(@bookmark),text: @bookmark.Bookmarkname
 	end
 	
end