class Answer < ActiveRecord::Base
  belongs_to :city
  belongs_to :problem
  has_one :result

  validates :city, presence: true
  validates :problem, presence: true, uniqueness: { scope: :city }
end
