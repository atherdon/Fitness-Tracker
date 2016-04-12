class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises, dependent: :destroy
  has_many :pictures, dependent: :destroy
  #has_many :comments, dependent: :destroy, :order => 'created_at DESC'

  validates :user, presence: true

  make_flaggable
  acts_as_commentable

  include StreamRails::Activity
  as_activity

  def activity_actor
    self.user
  end

  def activity_object
    self.id
  end
end
