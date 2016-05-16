class Record < ActiveRecord::Base
  # Validations
  validates_presence_of :expenditure, :document
  validates :expenditure, :numericality => { :greater_than_or_equal_to => 1 }

  # Associations
  belongs_to :item

  # Callbacks
  after_save :update_item
  after_save :update_project_spent

  # Carrierwave
  mount_uploader :document, AttachmentUploader

  # Notifications
  after_save :new_expenditure_notification

  def new_expenditure_notification
    @theItem = Item.find(self.item_id)
    @theProject = Project.find(@theItem.project_id)


    @staffs = Staff.all.where(admin: true)
    subject = "#{@theProject}"
    body = "New expenditure for item: #{@theItem} | Amount: #{self.expenditure}"
    @staffs.each do | staff |
      staff.notify(subject, body, obj = nil, sanitize_text = true, notification_code = @theProject.id)
    end
  end

  # Methods
  def update_item
    @theItem = Item.find(self.item_id)
    expenditureSum = @theItem.amount_spent + self.expenditure
    @theItem.update_attribute(:amount_spent, expenditureSum)
  end

  def update_project_spent
    @theItem = Item.find(self.item_id)
    @theProject = Project.find(@theItem.project_id)
    expenditureTotal = @theProject.total_amount_spent + expenditure
    @theProject.update_attribute(:total_amount_spent, expenditureTotal)
  end

end
