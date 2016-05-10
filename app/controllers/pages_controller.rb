class PagesController < ApplicationController
  def index
  end

  def staffoptions
    @staffs = Staff.all.sort_by &:contract_expiration_date
  end
end
