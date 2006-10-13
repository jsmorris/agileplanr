class AssociateReleaseToProject < ActiveRecord::Migration

  def self.up
    add_column :releases, :project_id, :integer
  end

  def self.down
    remove_column :release, :project_id
  end

end
