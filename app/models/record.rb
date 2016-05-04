class Record < ActiveRecord::Base
  belongs_to :item

  after_save :update_item

  def update_item
    @theItem = Item.find(self.item_id)
    expenditureSum = @theItem.amount_spent + self.expenditure

    @theItem.update_attributes(amount_spent: expenditureSum )
  end
end
