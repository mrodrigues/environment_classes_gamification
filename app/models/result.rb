class Result < ActiveRecord::Base
  belongs_to :answer

  validates :answer, presence: true

  serialize :characteristics, Array

  def characteristics=(value)
    super(if value.is_a? String then value.split(';').map(&:strip) else value end)
  end

end
