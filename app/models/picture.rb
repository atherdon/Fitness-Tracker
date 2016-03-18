class Picture < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout
  mount_uploader :attachment, ProfileUploader

  validates :user, presence: true
  validates :workout, presence: true
end
