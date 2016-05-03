class Item < ActiveRecord::Base
  belongs_to :project

  before_create :set_balance_left_attribute

  def set_balance_left_attribute
    self.balance_left = budget
  end

end
