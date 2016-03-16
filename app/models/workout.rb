class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises, dependent: :destroy
  has_many :pictures, dependent: :destroy

  make_flaggable
end
