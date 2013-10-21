#encoding: utf-8

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    dashboard
    if current_user.admin?
      admin_dashboard
    else
      regular_user_dashboard
    end
  end

  private
    def admin_dashboard
      render 'admin'
    end

    def regular_user_dashboard
      @user = if params[:id]
                User.find(params[:id])
              else
                current_user
              end

      @city = ResultsCalculator.new @user.city
      @answer = @user.answer_for(@problem)
      @result = @answer.try :result
      if @city.nil?
        if current_user == @user
          redirect_to new_city_path
        else
          redirect_to root_path, notice: 'Usuário ainda não criou sua cidade'
        end
      end
    end

    def dashboard
      @problem = Problem.current
    end
end
