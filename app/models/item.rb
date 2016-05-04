class Item < ActiveRecord::Base
  has_many :records 
  belongs_to :project

  #Callbacks
  before_create :set_balance_left_attribute
  before_update :update_balance, if: :amount_spent_changed?
  before_update :update_percentage, if: :amount_spent_changed?

  def set_balance_left_attribute
    self.balance_left = budget
  end

  def update_balance
    self.balance_left = self.budget - self.amount_spent
  end

  def update_percentage
    self.percentage_spent = (self.amount_spent / self.budget) * 100
  end

end
