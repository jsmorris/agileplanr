class AddRights < ActiveRecord::Migration

  def self.up
    Right.create(:name => "New Project", :controller => "project", :action => "new")
    Right.create(:name => "Edit Project", :controller => "project", :action => "edit")
    Right.create(:name => "List Project", :controller => "project", :action => "list")
    Right.create(:name => "Show Project", :controller => "project", :action => "show")
  end

  def self.down
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "New Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Edit Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "List Project" ]).id)
    Right.delete(Right.find(:first, :conditions => [ "name = ?", "Show Project" ]).id)
  end
  
end
