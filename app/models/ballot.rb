class Ballot < ActiveRecord::Base
  has_and_belongs_to_many :offices
  belongs_to :voter
  has_many :votes  
end
