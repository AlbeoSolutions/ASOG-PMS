class Project < ActiveRecord::Base
  has_many :jobs
  has_many :staffs, through: :jobs
  belongs_to :kpa_cluster
  has_many :tasks
  accepts_nested_attributes_for :tasks
end
