class Exercise < ActiveRecord::Base
  belongs_to :workout
  has_many :xsets, dependent: :destroy

  validates :workout, presence: true
end
