class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, through: :users
  store_accessor :exercises
end
