class CreateReleases < ActiveRecord::Migration

  def self.up
    create_table :releases do |t|
      t.column :name, :string
      t.column :start_at, :date
      t.column :end_at, :date
    end
  end

  def self.down
    drop_table :releases
  end

end
