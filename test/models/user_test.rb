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

  	test "user should enter a unique profile name" do
	  	user = User.new 
	  	user.profile_name = 'andrew' 
	  	user.email =  "drew@cif3r.com"
	  	user.first_name = "andrew"
	  	user.last_name = "amundson"
	  	user.password = "password"
	  	user.password_confirmation = "password"
	  	
	  	assert !user.save
	  	assert !user.errors[:profile_name].unique?
  	end

  	test "user should enter a profile name without spaces."
  		user = User.new
  		user.profile_name = 'Name with spaces.'

  		assert !user.save
  		assert !user.errors[:profile_name].empty?
  		assert user.errors[:profile_name].include?("Must be formatted correctly.")
  	end
end