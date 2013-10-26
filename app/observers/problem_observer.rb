class ProblemObserver < ActiveRecord::Observer

  def after_create(problem)
    ::NotificationMailer.problem_created(problem).deliver
  end

  def after_update(problem)
    ::NotificationMailer.problem_updated(problem).deliver
  end

end
