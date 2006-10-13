require File.dirname(__FILE__) + '/../test_helper'
require 'user_stories_controller'

# Re-raise errors caught by the controller.
class UserStoriesController; def rescue_action(e) raise e end; end

class UserStoriesControllerTest < Test::Unit::TestCase
  fixtures :user_stories

  def setup
    @controller = UserStoriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:user_stories)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:user_story)
    assert assigns(:user_story).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:user_story)
  end

  def test_create
    num_user_stories = UserStory.count

    post :create, :user_story => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_user_stories + 1, UserStory.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:user_story)
    assert assigns(:user_story).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil UserStory.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      UserStory.find(1)
    }
  end
end
