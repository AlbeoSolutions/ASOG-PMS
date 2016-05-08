class Project < ActiveRecord::Base
  validates_presence_of :project_title, :total_budget, :account_number
  has_many :jobs
  has_many :tasks
  has_many :items
  has_many :staffs, through: :jobs
  has_many :updates

  belongs_to :kpa_cluster

  before_save :update_actual_expenditure_percentage, if: :total_amount_spent_changed?

  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :items

  mount_uploader :project_summary_filename, AttachmentUploader
  mount_uploader :project_brief_filename, AttachmentUploader

  def update_actual_expenditure_percentage
    self.actual_expenditure_percentage = (self.total_amount_spent / self.total_budget) * 100
  end

  def get_tasks_done
    finCount = 0
    self.tasks.each do |task|
      if task.isFinished == true
        finCount = finCount + 1
      end
    end
    finCount
  end

  def get_task_percentage_done
    (self.get_tasks_done.to_f / self.tasks.count.to_f)*100
  end

  def to_s
    "#{self.project_title}"
  end
end
