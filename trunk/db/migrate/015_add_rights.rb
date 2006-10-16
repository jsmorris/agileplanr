class AddRights < ActiveRecord::Migration

  def self.up
    # Project rights
    Right.create(:name => "New Project", :controller => "projects", :action => "new")
    Right.create(:name => "Create Project", :controller => "projects", :action => "create")
    Right.create(:name => "Edit Project", :controller => "projects", :action => "edit")
    Right.create(:name => "Destroy Project", :controller => "projects", :action => "destroy")
    Right.create(:name => "List Projects", :controller => "projects", :action => "list")
    Right.create(:name => "Show Project", :controller => "projects", :action => "show")

    # Iteration rights
    Right.create(:name => "New Iteration", :controller => "iterations", :action => "new")
    Right.create(:name => "Create Iteration", :controller => "iterations", :action => "create")
    Right.create(:name => "Edit Iteration", :controller => "iterations", :action => "edit")
    Right.create(:name => "Destroy Iteration", :controller => "iterations", :action => "destroy")
    Right.create(:name => "List Iterations", :controller => "iterations", :action => "list")
    Right.create(:name => "Show Iteration", :controller => "iterations", :action => "show")
  end

  def self.down
    # Project rights
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "New Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Create Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Edit Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Destroy Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "List Projects" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Show Project" ]).id)

    # Iteration rights
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "New Iteration" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Create Iteration" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Edit Iteration" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Destroy Iteration" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "List Iterations" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Show Iteration" ]).id)
  end
  
end
