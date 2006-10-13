require File.dirname(__FILE__) + '/../test_helper'

class TaskTest < Test::Unit::TestCase
  fixtures :tasks

  def setup
    @task = Task.find(1)
    @user_story = UserStory.find(1)
  end

  def test_create
    assert_kind_of Task, @task
    assert_equal 1, @task.id
    assert_equal "Task A", @task.title
    assert_equal "This is the first Task", @task.description
    assert_equal @user_story, @task.user_story
  end
  
  def test_update
    new_title = "Task C"
    
    assert_equal "Task A", @task.title
    @task.title = new_title
    assert @task.save, @task.errors.full_messages.join("; ")
    @task.reload
    assert_equal new_title, @task.title
  end
  
  def test_destroy
    @task.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Task.find(@task.id)}
  end

end
