class PagesController < ApplicationController
  def index
  end

  def staffoptions
    @staffs = Staff.all.sort_by &:contract_expiration_date
  end

  def make_admin
    @staff = Staff.find(params[:id])
    @staff.update_attribute :admin, true
    redirect_to pages_staffoptions_path, notice: "#{@staff} successfully made admin"
  end
end
