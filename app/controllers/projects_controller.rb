class ProjectsController < ApplicationController

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @project_pages, @projects = paginate :projects, :per_page => 10
  end

  def show
    raise params.inspect
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    
    question = params[:question]
    
    question[:num_of_releases].to_i.times {|i| 
      release = Release.new
      release.name = get_release_name(i)
      release.start_at = get_start_at_date(question)
      release.end_at = get_end_at_date(question)
      release.project = @project
      question[:num_of_iterations].to_i.times {|i|
        iteration = Iteration.new
        iteration.name = get_iteration_name(release.name, i)
        iteration.release = release
        iteration.save
        }
      release.save
      }
    
    if @project.save!
      flash[:notice] = 'Project was successfully created.'
      redirect_to :action => 'list'
    else
      flash[:notice] = 'Project was not created.'
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project was successfully updated.'
      redirect_to :action => 'show', :id => @project
    else
      render :action => 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  private
  
  def get_release_name(i)
    name = @project.name + " " + i.to_s
  end
  
  def get_iteration_name(release_name, i)
    name = release_name + " " + i.to_s
  end
  
  
  def get_start_at_date(question)
    Date.new(question["start_at(1i)"].to_i, question["start_at(2i)"].to_i, question["start_at(3i)"].to_i)
  end

  def get_end_at_date(question)
    date = Date.new(question["start_at(1i)"].to_i, question["start_at(2i)"].to_i, question["start_at(3i)"].to_i)
    date + (question[:num_of_iterations].to_i * question[:iteration_length].to_i * 7)
  end
end
