module CancanHelper
  def can_answer
    Answer.new(problem: Problem.current, city: City.new(user: current_user))
  end

end
