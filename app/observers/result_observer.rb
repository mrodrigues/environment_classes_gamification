class ResultObserver < ActiveRecord::Observer

  def after_create(result)
    ::NotificationMailer.result_created(result).deliver
  end

  def after_update(result)
    ::NotificationMailer.result_updated(result).deliver
  end

end
