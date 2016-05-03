class Project < ActiveRecord::Base
  validates_presence_of :project_title, :total_budget, :account_number

  has_many :jobs
  has_many :tasks
  has_many :items
  has_many :staffs, through: :jobs

  belongs_to :kpa_cluster
  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :items

  def to_s
    "#{self.project_title}"
  end
end
