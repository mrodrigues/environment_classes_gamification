#encoding: utf-8

class UsersController < ApplicationController

  def index
    authorize! :index, user
    @users = User.all
  end

  def show
    authorize! :show, user
    dashboard
    if current_user.admin?
      admin_dashboard
    else
      regular_user_dashboard
    end
  end

  private
    def user
      @user ||= if params[:id]
                  User.find(params[:id])
                else
                  current_user
                end
    end

    def admin_dashboard
      render 'admin'
    end

    def regular_user_dashboard
      if user.city.nil?
        if current_user == user
          redirect_to new_city_path
        else
          redirect_to root_path, notice: 'Usuário ainda não criou sua cidade'
        end
        return
      end
      @city = ResultsCalculator.new user.city
      @answer = user.answer_for(@problem)
      @result = @answer.try :result
    end

    def dashboard
      @problem = Problem.current
    end
end
