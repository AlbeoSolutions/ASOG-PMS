class UpdatesController < ApplicationController
  
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_staff!

  def index
  	@jobs = Job.where(staff_id: current_staff.id)
  	id = Array.new
  	@jobs.each do |job|
  		id.push(job.project_id)
  	end
  	@staff = current_staff

  	@projects = Project.where(:id.in?(id))
  	@updates = Update.where(@projects.include? :project_id)
  
  =

  end



  def show
  	@update = Update.find(params[:id])
  	@update.update(read: true)
  end

  def delete
  end
end
