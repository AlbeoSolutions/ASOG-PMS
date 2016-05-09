class Record < ActiveRecord::Base
  belongs_to :item

  after_save :update_item
  after_save :update_project_spent

  mount_uploader :document, AttachmentUploader

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
