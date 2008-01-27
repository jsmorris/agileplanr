class AddRights < ActiveRecord::Migration

  def self.up
    # Project rights
    Right.create(:name => "New Project", :controller => "projects", :action => "new")
    Right.create(:name => "Create Project", :controller => "projects", :action => "create")
    Right.create(:name => "Edit Project", :controller => "projects", :action => "edit")
    Right.create(:name => "Destroy Project", :controller => "projects", :action => "destroy")
    Right.create(:name => "List Projects", :controller => "projects", :action => "list")
    Right.create(:name => "Index Projects", :controller => "projects", :action => "index")
    Right.create(:name => "Show Project", :controller => "projects", :action => "show")

    # Release rights
    Right.create(:name => "New Release", :controller => "releases", :action => "new")
    Right.create(:name => "Create Release", :controller => "releases", :action => "create")
    Right.create(:name => "Edit Release", :controller => "releases", :action => "edit")
    Right.create(:name => "Destroy Release", :controller => "releases", :action => "destroy")
    Right.create(:name => "List Releases", :controller => "releases", :action => "list")
    Right.create(:name => "Index Releases", :controller => "releases", :action => "index")
    Right.create(:name => "Show Release", :controller => "releases", :action => "show")

    # Iteration rights
    Right.create(:name => "New Iteration", :controller => "iterations", :action => "new")
    Right.create(:name => "Create Iteration", :controller => "iterations", :action => "create")
    Right.create(:name => "Edit Iteration", :controller => "iterations", :action => "edit")
    Right.create(:name => "Destroy Iteration", :controller => "iterations", :action => "destroy")
    Right.create(:name => "List Iterations", :controller => "iterations", :action => "list")
    Right.create(:name => "Index Iterations", :controller => "iterations", :action => "index")
    Right.create(:name => "Show Iteration", :controller => "iterations", :action => "show")

    # User Story rights
    Right.create(:name => "New User Story", :controller => "user_stories", :action => "new")
    Right.create(:name => "Create User Story", :controller => "user_stories", :action => "create")
    Right.create(:name => "Edit User Story", :controller => "user_stories", :action => "edit")
    Right.create(:name => "Destroy User Story", :controller => "user_stories", :action => "destroy")
    Right.create(:name => "List User Stories", :controller => "user_stories", :action => "list")
    Right.create(:name => "Index User Stories", :controller => "user_stories", :action => "index")
    Right.create(:name => "Show User Story", :controller => "user_stories", :action => "show")
    Right.create(:name => "Edit User Story Description", :controller => "user_stories", :action => "update_description")    
    
  end

  def self.down
    # Project rights
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "New Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Create Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Edit Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Destroy Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "List Projects" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Index Projects" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Show Project" ]).id)

    # Release rights
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "New Release" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Create Release" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Edit Release" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Destroy Release" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "List Releases" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Index Releases" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Show Release" ]).id)

    # Iteration rights
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "New Iteration" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Create Iteration" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Edit Iteration" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Destroy Iteration" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "List Iterations" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Index Iterations" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Show Iteration" ]).id)

    # User Story rights
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "New User Story" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Create User Story" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Edit User Story" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Destroy User Story" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "List User Stories" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Index User Stories" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Show User Story" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Edit User Story Description" ]).id)    
  end
  
end
