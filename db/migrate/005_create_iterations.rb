class CreateIterations < ActiveRecord::Migration

  def self.up
    create_table :iterations do |t|
      t.column :name, :string
    end
  end

  def self.down
    drop_table :iterations
  end

end
