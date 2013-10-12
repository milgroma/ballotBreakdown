class Ballot < ActiveRecord::Base
  has_and_belongs_to_many :offices
end
