class Rep < ActiveRecord::Base
  belongs_to :xset

  validates :xset, presence: true
end
