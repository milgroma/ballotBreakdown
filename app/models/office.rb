class Office < ActiveRecord::Base
  has_and_belongs_to_many :ballots
  has_and_belongs_to_many :politicians
  has_many :votes, :through => :ballots
end
