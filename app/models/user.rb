class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  attr_accessor :login
  validate :validate_username
  #serialize :preferences, UserPreferences
  store_accessor :preferences
  has_many :pictures, dependent: :destroy
  has_many :workouts, dependent: :destroy
  has_many :suggestions, dependent: :destroy

  acts_as_followable
  acts_as_follower

  has_many :followable

  make_flaggable
  make_flagger :flag_once => true

  
  

  def to_param
  	username
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def validate_username
	  if User.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
	end

  scope :recommended_users, (lambda do |user|
    return all unless user.present?
    where.not(id: user.following_users.ids << user.id)
  end)
end






















