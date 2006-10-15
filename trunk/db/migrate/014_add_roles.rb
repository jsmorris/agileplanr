class AddRoles < ActiveRecord::Migration

  def self.up
    Role.create(:name => "Admin")
    Role.create(:name => "Developer")
    Role.create(:name => "Customer")
    Role.create(:name => "Tester")
  end

  def self.down
    Role.delete(Role.find(:first, :conditions => [ "name = ?", "Admin" ]).id)
    Role.delete(Role.find(:first, :conditions => [ "name = ?", "Developer" ]).id)
    Role.delete(Role.find(:first, :conditions => [ "name = ?", "Customer" ]).id)
    Role.delete(Role.find(:first, :conditions => [ "name = ?", "Tester" ]).id)
  end

end
