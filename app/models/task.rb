class Task < ActiveRecord::Base
  belongs_to :project

  mount_uploader :submission, AttachmentUploader
end
