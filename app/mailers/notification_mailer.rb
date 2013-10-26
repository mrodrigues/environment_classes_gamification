class NotificationMailer < ActionMailer::Base

  def problem_created(problem)
    @problem = problem
    mail to: users, subject: "[CMA] #{Problem.model_name.human} criado"
  end

  def problem_updated(problem)
    @problem = problem
    mail to: users, subject: "[CMA] #{Problem.model_name.human} atualizado"
  end

  def result_created(result)
    @result = result
    mail to: result.answer.city.user.email, subject: "[CMA] #{Result.model_name.human} criado"
  end

  def result_updated(result)
    @result = result
    mail to: result.answer.city.user.email, subject: "[CMA] #{Result.model_name.human} atualizado"
  end

  def answer_created(answer)
    @answer = answer
    mail to: admins, subject: "[CMA] #{Answer.model_name.human} criado"
  end

  def answer_updated(answer)
    @answer = answer
    mail to: admins, subject: "[CMA] #{Answer.model_name.human} atualizado"
  end

  private
    def users
      User.where(admin: false).map(&:email)
    end

    def admins
      User.where(admin: true).map(&:email)
    end
end
