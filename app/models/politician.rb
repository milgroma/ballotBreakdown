class Politician < ActiveRecord::Base
  has_and_belongs_to_many :offices
  has_many :notes
end
