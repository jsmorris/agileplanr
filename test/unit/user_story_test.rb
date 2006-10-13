require File.dirname(__FILE__) + '/../test_helper'

class UserStoryTest < Test::Unit::TestCase
  fixtures :user_stories

  def setup
    @user_story = UserStory.find(1)
    @iteration = Iteration.find(1)
  end

  def test_create
    assert_kind_of UserStory, @user_story
    assert_equal 1, @user_story.id
    assert_equal "User Story 1", @user_story.title
    assert_equal "This is the first User Story", @user_story.description
    assert_equal @iteration, @user_story.iteration
  end
  
  def test_update
    new_title = "User Story 3"
    
    assert_equal "User Story 1", @user_story.title
    @user_story.title = new_title
    assert @user_story.save, @user_story.errors.full_messages.join("; ")
    @user_story.reload
    assert_equal new_title, @user_story.title
  end
  
  def test_destroy
    @user_story.destroy
    assert_raise(ActiveRecord::RecordNotFound) { UserStory.find(@user_story.id)}
  end

end
