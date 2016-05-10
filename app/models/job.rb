class Job < ActiveRecord::Base
  # Associations
  belongs_to :staff
  belongs_to :project
end
