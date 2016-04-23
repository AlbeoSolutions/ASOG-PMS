class Project < ActiveRecord::Base
  has_many :jobs
  has_many :staffs, through: :jobs
  belongs_to :kpa_cluster
end
