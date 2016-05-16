class Project < ActiveRecord::Base
  # Validations
  validates_presence_of :project_title, :total_budget, :account_number, :project_director, :funding_agency,:on => :create
  validates :total_budget, :numericality => { :greater_than_or_equal_to => 1 }, :on => :create
  validate :date_validation, :on => :create

  def date_validation
    if self[:end_date] < self[:start_date] || self[:end_date] == self[:start_date]
      errors[:end_date] << "End date should be later than start date"
      return false
    else
      return true
    end
  end


  # Associations
  has_many :jobs
  has_many :tasks
  has_many :items
  has_many :staffs, through: :jobs
  belongs_to :kpa_cluster

  # Callbacks
  before_save :update_actual_expenditure_percentage, if: :total_amount_spent_changed?

  # Nested forms
  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :items

  # Carrierwave
  mount_uploader :project_summary_filename, AttachmentUploader
  mount_uploader :project_brief_filename, AttachmentUploader


  # Methods
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

  def get_items
    self.items.map(&:item_title)
  end

  def get_overdue_tasks
    taskCount = 0
    self.tasks.each do |task|
      if task.due_date < Date.today && task.isFinished == false
        taskCount += 1
      end
    end
    taskCount
  end

  def get_expiring_staff
    self.staffs.each do |staff|
      aMonth = Date.today - staff.contract_expiration_date
      if aMonth < 30
        staff
      end
    end
  end

  def get_project_summary
    "#{self.project_summary_filename}"
  end

  def get_project_brief
    "#{self.project_brief_filename}"
  end

  def to_s
    "#{self.project_title}"
  end

end
