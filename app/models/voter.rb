class Voter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :votes, :through => :ballots
  has_many :ballots
  
  after_create :send_new_signup_notification
  def send_new_signup_notification
    SignupMailer.new_signup_notification(self).deliver
  end
  
end
