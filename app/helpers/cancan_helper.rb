module CancanHelper
  def can_answer
    Answer.new(city: City.new(user: current_user))
  end

end
