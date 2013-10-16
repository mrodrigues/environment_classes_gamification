module CancanHelper
  def can_answer
    Answer.new(city: City.new)
  end

end
