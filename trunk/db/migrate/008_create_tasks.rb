class CreateTasks < ActiveRecord::Migration
  
  def self.up
    create_table :tasks do |t|
      t.column :title, :string
      t.column :description, :string
    end
  end

  def self.down
    drop_table :tasks
  end

end
