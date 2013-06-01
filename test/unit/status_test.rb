require 'test_helper'

class StatusTest < ActiveSupport::TestCase

  test "that status requires content" do 
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:contet].empty?
  end

  test "that status's content at least 2 letters long'" do 
  	status = Status.new
  	status.contet="H"
  	assert !status.save
  	assert !status.errors[:contet].empty?
  end

  test "that status have user id" do
    status = Status.new
    status.contet = "Hello"
    assert !status.save
  	assert !status.errors[:user_id].empty?


  end


end
