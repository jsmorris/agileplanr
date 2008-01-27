class AssignRightsToRoles < ActiveRecord::Migration

  def self.up
    role = Role.find(:first, :conditions => [ "name = ?", "Admin" ])

    # Project rights
    role.rights << Right.find(:first, :conditions => [ "name = ?", "New Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Create Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Edit Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Destroy Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "List Projects" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Index Projects" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Show Project" ])
    
    # Release rights
    role.rights << Right.find(:first, :conditions => [ "name = ?", "New Release" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Create Release" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Edit Release" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Destroy Release" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "List Releases" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Index Releases" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Show Release" ])

    # Iteration rights
    role.rights << Right.find(:first, :conditions => [ "name = ?", "New Iteration" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Create Iteration" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Edit Iteration" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Destroy Iteration" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "List Iterations" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Index Iterations" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Show Iteration" ])

    # User Story rights
    role.rights << Right.find(:first, :conditions => [ "name = ?", "New User Story" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Create User Story" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Edit User Story" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Destroy User Story" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "List User Stories" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Index User Stories" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Show User Story" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Edit User Story Description" ])

    role.save
  end

  def self.down
    role = Role.find(:first, :conditions => [ "name = ?", "Admin" ])
    
    role.rights.clear
    role.save
  end

end
