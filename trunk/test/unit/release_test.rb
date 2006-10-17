require File.dirname(__FILE__) + '/../test_helper'

class ReleaseTest < Test::Unit::TestCase
  fixtures :projects, :releases, :iterations

  def setup
    @release = Release.find(1)
    @project = Project.find(1)
  end

  def test_create
    assert_kind_of Release, @release
    assert_equal 1, @release.id
    assert_equal "Alpha", @release.name
    assert_equal @project, @release.project
    assert_equal 2, @release.iterations.count
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
  
  def test_save_without_name
    release = Release.create(:name => nil, :start_at => "2006-10-14", :end_at => "2006-10-15", :project => @project)
    assert_equal(1, release.errors.count)
    assert_equal("can't be blank", release.errors[:name])
  end
  
  def test_start_at_is_after_end_at
    release = Release.create(:name => "Omega", :start_at => "2006-10-16", :end_at => "2006-10-15", :project => @project)
    assert_equal(1, release.errors.count)
    assert_equal("must be earlier than end at date", release.errors[:start_at])
  end

  def test_save_without_assigning_to_project
    release = Release.create(:name => "Omega", :start_at => "2006-10-14", :end_at => "2006-10-15")
    assert_equal(1, release.errors.count)
    assert_equal("must be assigned to a project", release.errors[:project])
  end
    
end
