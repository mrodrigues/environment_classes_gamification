class City < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :valid_answers, ->{ includes(:result).where(results: { valid_answer: true }) }, class_name: "Answer"
  validates :name, uniqueness: true
end
