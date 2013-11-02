class Vote < ActiveRecord::Base
  belongs_to :ballot
  belongs_to :voter
  belongs_to :office
  belongs_to :politician
end
