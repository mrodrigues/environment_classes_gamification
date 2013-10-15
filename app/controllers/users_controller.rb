class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = if params[:id]
              User.find(params[:id])
            else
              current_user
            end

    @city = @user.city
    @problem = Problem.current
    @answer = @user.answer_for(@problem)
    if @city.nil?
      redirect_to new_city_path
    end
  end
end
