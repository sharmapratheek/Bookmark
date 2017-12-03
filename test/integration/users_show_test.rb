require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
	

	def setup
		@user = User.create(name: "NameUser" , email: "username@email.com",
							password: "password",password_confirmation: "password")
		@bookmark = @user.bookmarks.build(Bookmarkname: "B5" , link: "www.sample88.com")
		@bookmark.save  
	end

	test "should get users shows" do 
		get user_path(@user)
		assert_template 'users/show'
		
	end

end
