class Release < ActiveRecord::Base
  belongs_to :project
  has_many :iterations
  
  validates_presence_of :name
  validates_presence_of :project, :message => "must be assigned to a project"
    
  def validate
    unless start_at < end_at
      errors.add(:start_at, "must be earlier than end at date")
    end
  end
  
end
