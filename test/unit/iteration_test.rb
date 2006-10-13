require File.dirname(__FILE__) + '/../test_helper'

class IterationTest < Test::Unit::TestCase
  fixtures :iterations

   def setup
    @iteration = Iteration.find(1)
    @release = Release.find(1)
  end

  def test_create
    assert_kind_of Iteration, @iteration
    assert_equal 1, @iteration.id
    assert_equal "Alpha 1", @iteration.name
    assert_equal @release, @iteration.release
  end
  
  def test_update
    new_name = "Charlie"
    
    assert_equal "Alpha 1", @iteration.name
    @iteration.name = new_name
    assert @iteration.save, @iteration.errors.full_messages.join("; ")
    @iteration.reload
    assert_equal new_name, @iteration.name
  end
  
  def test_destroy
    @iteration.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Iteration.find(@iteration.id)}
  end
    
end
