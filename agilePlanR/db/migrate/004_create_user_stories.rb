class CreateUserStories < ActiveRecord::Migration
  def self.up
    create_table :user_stories do |t|
      t.column :title, :string
      t.column :description, :string
    end
  end

  def self.down
    drop_table :user_stories
  end
end
