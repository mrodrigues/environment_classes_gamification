class Problem < ActiveRecord::Base
  has_many :answers

  default_scope order('ends_at ASC')

  validates :ends_at, presence: true

  def self.current
    Problem.where('ends_at >= ?', DateTime.current).first
  end
end
