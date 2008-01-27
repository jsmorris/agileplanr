class AssociateUserStoriesToUsers < ActiveRecord::Migration

  def self.up

    create_table :user_stories_users, :id => false do |t|
      t.column :user_story_id, :integer
      t.column :user_id, :integer
    end

  end

  def self.down
    drop_table :user_stories_users
  end

end