class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises, dependent: :destroy
  has_many :pictures, dependent: :destroy

  validates :user, presence: true

  make_flaggable

  include StreamRails::Activity
  as_activity

  def activity_actor
    self.user
  end

  def activity_object
    self.item
  end
end
