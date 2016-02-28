class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  mount_uploader :attachment, ProfileUploader

end
