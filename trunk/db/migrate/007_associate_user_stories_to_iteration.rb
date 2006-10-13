class AssociateUserStoriesToIteration < ActiveRecord::Migration

  def self.up
    add_column :user_stories, :iteration_id, :integer
  end

  def self.down
    remove_column :user_stories, :iteration_id
  end

end
