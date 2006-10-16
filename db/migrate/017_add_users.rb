class AddUsers < ActiveRecord::Migration

  def self.up
    admin = User.create(:username => "Admin")
    admin.password = "admin"
    admin.roles << Role.find(:first, :conditions => [ "name = ?", "Admin" ])
    admin.save
    
    guest = User.create(:username => "Guest")
    guest.password = "guest"
    guest.save
  end

  def self.down
    User.delete(User.find(:first, :conditions => [ "username = ?", "Admin" ]).id)
    User.delete(User.find(:first, :conditions => [ "username = ?", "Guest" ]).id)
  end

end
