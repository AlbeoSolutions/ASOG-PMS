class Project < ActiveRecord::Base
  has_many :jobs
  has_many :staffs, through: :jobs
end
