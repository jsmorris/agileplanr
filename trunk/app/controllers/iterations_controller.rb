class IterationsController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @iteration_pages, @iterations = paginate :iterations, :per_page => 10
  end

  def show
    @iteration = Iteration.find(params[:id])
  end

  def new
    @iteration = Iteration.new
  end

  def create
    @iteration = Iteration.new(params[:iteration])
    if @iteration.save
      flash[:notice] = 'Iteration was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @iteration = Iteration.find(params[:id])
  end

  def update
    @iteration = Iteration.find(params[:id])
    if @iteration.update_attributes(params[:iteration])
      flash[:notice] = 'Iteration was successfully updated.'
      redirect_to :action => 'show', :id => @iteration
    else
      render :action => 'edit'
    end
  end

  def destroy
    Iteration.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
