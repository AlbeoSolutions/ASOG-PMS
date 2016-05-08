class UpdatesController < ApplicationController
  

  def index
    if current_staff.admin == false
      @jobs = Job.where(staff_id: current_staff.id)
      id = Array.new
      @jobs.each do |job|
        project = job.project
        b = project.id
        id.push(b)
      end
      @projects = Array.new
      id.each do |i|
        project = Project.find(i)
        @projects.push(project)
      end
    else
      @projects = Project.all
    end

  	
  	
  	
  	
  	
  
  

  end



  def show
  	@update = Update.find(params[:id])
  	@update.update(read: true)
  end

  def delete
  end
end
