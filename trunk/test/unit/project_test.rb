require File.dirname(__FILE__) + '/../test_helper'

class ProjectTest < Test::Unit::TestCase
  fixtures :projects

  def setup
    @project = Project.find(1)
  end
  
  def test_create
    assert_kind_of Project, @project
    assert_equal 1, @project.id
    assert_equal "Indicators", @project.name
    assert_equal 2, @project.releases.count
  end
  
  def test_update
    new_name = "The new and improved Indicators"
    
    assert_equal "Indicators", @project.name
    @project.name = new_name
    assert @project.save, @project.errors.full_messages.join("; ")
    @project.reload
    assert_equal new_name, @project.name
  end
  
  def test_destroy
    @project.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Project.find(@project.id)}
  end
  
end
