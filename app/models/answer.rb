class Answer < ActiveRecord::Base
  belongs_to :city
  belongs_to :turn
  has_one :result
end
