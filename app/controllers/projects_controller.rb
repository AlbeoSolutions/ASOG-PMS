class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_staff!

  # Custom Pages
  def progress
    @project = Project.find(params[:project_id])
    @items = @project.items

    records = Record.where(item_id: @project.items.pluck(:id)).group_by { |m| m.created_at.beginning_of_month }
    @data = Hash.new(0)
    records.each { |k,v| @data[k.strftime("%B")] = v.count }
  end

  # Custom functionality
  def finish_project
    @project = Project.find(params[:id])
    @project.update_attributes(isOngoing: false)
    respond_to do |format|
      format.html {redirect_to projects_path, notice: "Project: #{self} marked as complete"}
    end
  end

  def read
    notification = current_staff.mailbox.notifications.find(params[:id])
    notification.mark_as_read(current_staff)
    @project = Project.find(notification.notification_code)
    # @project = Project.find(params[:id])
    @staff = current_staff
    redirect_to project_path(@project)
  end

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.sort_by(&:updated_at).reverse
    @staff = current_staff
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @staff = current_staff
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    # Delete tasks within project
    @project.tasks.each do  |task|
      task.destroy
    end

    # Delete items and records within project
    @project.items.each do |item|
      item.records.each do |record|
        record.destroy
      end
      item.destroy
    end

    # Delete jobs within project
    @project.jobs.each do |job|
      job.destroy
    end

    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit!
    end

end
