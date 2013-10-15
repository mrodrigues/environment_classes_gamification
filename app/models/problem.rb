class Problem < ActiveRecord::Base
  has_many :answers

  def self.current
    Problem.where('ends_at >= ?', DateTime.current).first
  end
end
