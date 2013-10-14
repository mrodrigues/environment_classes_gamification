class Result < ActiveRecord::Base
  belongs_to :answer
  serialize :characteristics, Array
end
