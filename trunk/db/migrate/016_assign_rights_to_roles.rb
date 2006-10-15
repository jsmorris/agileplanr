class AssignRightsToRoles < ActiveRecord::Migration

  def self.up
    role = Role.find(:first, :conditions => [ "name = ?", "Admin" ])

    role.rights << Right.find(:first, :conditions => [ "name = ?", "New Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Edit Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "List Project" ])
    role.rights << Right.find(:first, :conditions => [ "name = ?", "Show Project" ])
    
    role.save
  end

  def self.down
    role = Role.find(:first, :conditions => [ "name = ?", "Admin" ])
    
    role.rights.clear
    role.save
  end

end
