require File.dirname(__FILE__) + '/../test_helper'

class ReleaseTest < Test::Unit::TestCase
  fixtures :releases

  def setup
    @release = Release.find(1)
    @project = Project.find(1)
  end

  def test_create
    assert_kind_of Release, @release
    assert_equal 1, @release.id
    assert_equal "Alpha", @release.name
    assert_equal @project, @release.project
  end
  
  def test_update
    new_name = "Charlie"
    
    assert_equal "Alpha", @release.name
    @release.name = new_name
    assert @release.save, @release.errors.full_messages.join("; ")
    @release.reload
    assert_equal new_name, @release.name
  end
  
  def test_destroy
    @release.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Release.find(@release.id)}
  end
    
end
