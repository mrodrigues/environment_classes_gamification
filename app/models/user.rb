class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :city

  def answer_for(problem)
    return if problem.nil?
    city.answers.where(problem_id: problem.id).first
  end
end
