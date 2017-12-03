require "test_helper"

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Name1" ,email: "Name1@gmail.com",
						password: "password",password_confirmation: "password") 
	end

	test "should be valid" do 
		assert @user.valid?
	end

	test "should have a name" do 
		@user.name = " "
		assert_not @user.valid?
	end

	test "should have a email" do 
		@user.email = " "
		assert_not @user.valid?
	end
	test "name should not excede 30 characters" do 
		@user.name = "a" * 31
		assert_not @user.valid?
	end

	test "email should not excede 255 characters" do 
		@user.email = "a" * 256
		assert_not @user.valid?
	end

	test "email should accept correct format " do 
		valid_emails = %w[sample@gmail.com sample1+sample2@gmail.com sample2@example.com]
		valid_emails.each do |valids|
			@user.email = valids 
			assert @user.valid?, "#{valids.inspect} should be valid" 
		end
	end

	test "email reject invalid address " do 
		invalid_emails = %w[sample.com sample@gmail,com sample@.com]
		invalid_emails.each do |invalids|
			@user.email = invalids
			assert_not @user.valid?, "#{invalids.inspect} should be invalid"
		end
	end

	test "email should be unique and case sensisty" do 
		duplicate_user = @user.dup 
		duplicate_user.email = @user.email.upcase 
		@user.save 
		assert_not duplicate_user.valid?
	end

	test "password should be present " do 
		@user.password = @user.password_confirmation = " "
		assert_not @user.valid?
	end

	test "password should have atleast 5 chracters " do 
		@user.password = @user.password_confirmation = "a" * 4
		assert_not @user.valid?
	end
end