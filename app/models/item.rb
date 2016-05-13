class Item < ActiveRecord::Base
  # Associations
  has_many :records
  belongs_to :project

  # Callbacks
  before_create :set_balance_left_attribute

  before_save :update_balance, if: :amount_spent_changed?
  before_save :update_percentage, if: :amount_spent_changed?

  before_update :update_balance, if: :budget_changed?
  before_update :update_percentage, if: :budget_changed?

  # Custom Methods
  def set_balance_left_attribute
    self.balance_left = budget
  end

  def update_balance
    self.balance_left = self.budget - self.amount_spent
  end

  def update_percentage
    self.percentage_spent = (self.amount_spent / self.budget) * 100
  end

  def to_s
    "#{self.item_title}"
  end

end
