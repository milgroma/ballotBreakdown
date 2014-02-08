class Ballot < ActiveRecord::Base
  has_and_belongs_to_many :offices
  belongs_to :voter
  has_many :votes
  
  accepts_nested_attributes_for :votes, allow_destroy: true
end
