class Iteration < ActiveRecord::Base
  belongs_to :release
  has_many :user_stories
end
