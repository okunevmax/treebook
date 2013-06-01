require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name " do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name " do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name " do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name " do
  	user = User.new
  	user.profile_name = users(:jason).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have profile name without spaces" do
    user = User.new(first_name: 'Max' , last_name: 'Okunev' , email: 'okunevmax@gmail.com')
    user.password = user.password_confirmation = 'asasasas'
    user.profile_name = "My profile name"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert  user.errors[:profile_name].include?("Must be formated correctly.")
  end

  test "a user can have acorrectly formated profile name" do
    user = User.new(first_name: 'Max' , last_name: 'Okunev' , email: 'okunevmax@gmail.com')
    user.password = user.password_confirmation = 'asasasas'
    user.profile_name = 'max_123'
    assert user.valid?
end

end
