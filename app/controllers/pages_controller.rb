class PagesController < ApplicationController

  def staffoptions
    @staffs = Staff.all.where(admin: false).sort_by &:contract_expiration_date
  end

  def make_admin
    @staff = Staff.find(params[:id])
    @staff.update_attribute :admin, true
    respond_to do |format|
      format.html {redirect_to pages_staffoptions_path, notice: "#{@staff} Successfully made admin"}
    end
  end

end
