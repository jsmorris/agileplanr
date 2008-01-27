class UserStory < ActiveRecord::Base
  belongs_to :iteration
  has_many :tasks
  has_and_belongs_to_many :developers, :class_name => "User"
end
