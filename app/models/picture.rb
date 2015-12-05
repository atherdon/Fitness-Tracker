class Picture < ActiveRecord::Base
  belongs_to :user
  mount_uploader :attachment, ProfileUploader

end
