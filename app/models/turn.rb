class Turn < ActiveRecord::Base
  has_many :answers
  has_one :problem
end
