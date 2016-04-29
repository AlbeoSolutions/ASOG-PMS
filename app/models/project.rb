class Project < ActiveRecord::Base
  validates_presence_of :project_title, :total_budget, :account_number

  has_many :jobs
  has_many :staffs, through: :jobs
  belongs_to :kpa_cluster
  has_many :tasks
  accepts_nested_attributes_for :tasks

  def to_s
    "#{self.project_title}"
  end
end
