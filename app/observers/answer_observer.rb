class AnswerObserver < ActiveRecord::Observer

  def after_create(answer)
    ::NotificationMailer.answer_created(answer).deliver
  end

  def after_update(answer)
    ::NotificationMailer.answer_updated(answer).deliver
  end

end
