class NotificationMailer < ActionMailer::Base
  
  def problem_created(problem)
    @problem = problem
    mail to: users, subject: "[CMA] Problema criado"
  end

  private
    def users
      User.where(admin: false).map(&:email)
    end
end
