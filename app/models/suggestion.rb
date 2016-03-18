class Suggestion < ActiveRecord::Base
  belongs_to :user

  validates :user, true
end
