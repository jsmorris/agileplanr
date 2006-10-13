class UserStoriesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @user_story_pages, @user_stories = paginate :user_stories, :per_page => 10
  end

  def show
    @user_story = UserStory.find(params[:id])
  end

  def new
    @user_story = UserStory.new
  end

  def create
    @user_story = UserStory.new(params[:user_story])
    if @user_story.save
      flash[:notice] = 'UserStory was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @user_story = UserStory.find(params[:id])
  end

  def update
    @user_story = UserStory.find(params[:id])
    if @user_story.update_attributes(params[:user_story])
      flash[:notice] = 'UserStory was successfully updated.'
      redirect_to :action => 'show', :id => @user_story
    else
      render :action => 'edit'
    end
  end

  def destroy
    UserStory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
