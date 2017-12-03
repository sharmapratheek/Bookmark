require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(name: "NameUser" , email: "username@email.com",
							password: "password",password_confirmation: "password")
	end

	test "reject invalid edit " do 
		get edit_user_path(@user) 
		assert_template "users/edit" 
		patch user_path,params: {user: {name: " ",email: "username@email.com"}}
		assert_template "users/edit"
end


	test "accept valid signup " do 
		get edit_user_path(@user) 
		assert_template "users/edit" 
		patch user_path,params: {user: {name: "NameUser1",email: "username1@email.com"}}
		assert_redirected_to user_path(@user) 
		assert_not flash.empty?
		@user.reload
		assert_match "NameUser1",@user.name 
		assert_match "sername1@email.com",@user.email
	end
end
