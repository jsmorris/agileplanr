class AssociateTaskToUserStory < ActiveRecord::Migration
  
  def self.up
    add_column :tasks, :user_story_id, :integer
  end

  def self.down
    remove_column :tasks, :user_story_id
  end
  
end
