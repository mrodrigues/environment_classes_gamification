class Answer < ActiveRecord::Base
  belongs_to :city
  belongs_to :problem
  has_one :result
end
