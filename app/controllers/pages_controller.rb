class PagesController < ApplicationController
  def index
  end

  def staffoptions
    @staffs = Staff.all
  end
end
