class ProcessAttachment < ActiveRecord::Base
  
  mount_uploader :attachment, AttachmentUploader
  
end
