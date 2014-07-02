require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "user should enter first name" do
	  	user = User.new   
	  	assert !user.save
	  	assert !user.errors[:first_name].empty?
  	end

  	test "user should enter last name" do
	  	user = User.new   
	  	assert !user.save
	  	assert !user.errors[:last_name].empty?
  	end

  	test "user should enter profile name" do
	  	user = User.new   
	  	assert !user.save
	  	assert !user.errors[:profile_name].empty?
  	end

  	test "a user should have a unique profile name" do
    	user = User.new
    	user.profile_name = users(:andrew).profile_name
    
    	assert !user.save
    	assert !user.errors[:profile_name].empty?
  	end

  	test "a user should have a profile name without spaces" do
		user = User.new(first_name: 'andrew', last_name: 'amundson', email: 'drewcif3r@gmail.com')
		user.profile_name = 'Mike The Frog'
		user.password = user.password_confirmation = '0yearight'

		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end

	
	test "a user can have a correctly formatted profile name" do
    	user = User.new(first_name: 'andrew', last_name: 'amundson', email: 'drewcif3r@gmail.com')
    	user.password = user.password_confirmation = '0yearight'

	    user.profile_name = 'andrew'
    	assert user.valid?
  	end
end