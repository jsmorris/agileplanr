class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.column :name, :string
    end
  end

  def self.down
    drop_table :releases
  end
end
