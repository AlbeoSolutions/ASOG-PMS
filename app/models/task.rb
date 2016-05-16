class Task < ActiveRecord::Base
  # Validations

  # Associations
  belongs_to :project

  # Carrierwave
  mount_uploader :submission, AttachmentUploader

  # Notifications
  after_update :finish_task_notification, if: :isFinished_changed?

  def finish_task_notification
    @theProject = Project.find(self.project_id)

    @staffs = Staff.all.where(admin: true)
    subject = "#{@theProject}"
    body = "Task: #{self.task_title} marked as Finished"
    @staffs.each do | staff |
      staff.notify(subject, body)
    end
  end

  def get_is_overdue
    if Date.today > self.due_date
      return true
    end
  end

end
