# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 7) do

  create_table "iterations", :force => true do |t|
    t.column "name", :string
    t.column "release_id", :integer
  end

  create_table "projects", :force => true do |t|
    t.column "name", :string
  end

  create_table "releases", :force => true do |t|
    t.column "name", :string
    t.column "project_id", :integer
  end

  create_table "user_stories", :force => true do |t|
    t.column "iteration_id", :integer
  end

end
