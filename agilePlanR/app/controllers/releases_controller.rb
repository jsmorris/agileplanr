class ReleasesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @release_pages, @releases = paginate :releases, :per_page => 10
  end

  def show
    @release = Release.find(params[:id])
  end

  def new
    @release = Release.new
  end

  def create
    @release = Release.new(params[:release])
    if @release.save
      flash[:notice] = 'Release was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @release = Release.find(params[:id])
  end

  def update
    @release = Release.find(params[:id])
    if @release.update_attributes(params[:release])
      flash[:notice] = 'Release was successfully updated.'
      redirect_to :action => 'show', :id => @release
    else
      render :action => 'edit'
    end
  end

  def destroy
    Release.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
