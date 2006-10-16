class AssignRightsToRoles < ActiveRecord::Migration

  def self.up
    role = Role.find(:first, :conditions => [ "name = ?", "Admin" ])

    # Project rights
    role.rights << Right.find(:first, :conditions => [ "name = ?", "New Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Create Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Edit Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Destroy Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "List Projects" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Show Project" ])
    
    # Iteration rights
    role.rights << Right.find(:first, :conditions => [ "name = ?", "New Iteration" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Create Iteration" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Edit Iteration" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Destroy Iteration" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "List Iterations" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Show Iteration" ])

    role.save
  end

  def self.down
    role = Role.find(:first, :conditions => [ "name = ?", "Admin" ])
    
    role.rights.clear
    role.save
  end

end
