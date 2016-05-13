class Task < ActiveRecord::Base
  # Associations
  belongs_to :project

  # Carrierwave
  mount_uploader :submission, AttachmentUploader
end
