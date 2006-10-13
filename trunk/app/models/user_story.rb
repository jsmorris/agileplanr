class UserStory < ActiveRecord::Base
  belongs_to :iteration
  has_many :tasks
end
