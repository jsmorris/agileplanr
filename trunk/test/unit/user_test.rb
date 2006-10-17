require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  fixtures :users

  def setup
    @user = User.find(1)
  end

  def test_create
    assert_kind_of User, @user
    assert_equal 1, @user.id    
  end
  
  def test_authenticate
    assert_raise(RuntimeError) { User.authenticate(@user.username, "xxxxxx") }
    assert_nothing_raised(Exception) { User.authenticate(@user.username, "secret") }
  end
  
  def test_uniqueness
    user = User.create(:username => "chad") 
    user.save    
    assert_equal(1, user.errors.count)
    assert_equal("has already been taken", user.errors[:username])
  end

end
