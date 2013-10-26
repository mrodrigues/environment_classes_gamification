class CitiesController < ApplicationController

  def new
    @city = City.new(user: current_user)
    authorize! :new, @city
  end

  def create
    @city = City.new(city_params)
    @city.user = current_user
    authorize! :create, @city

    if @city.save
      redirect_to root_path, notice: 'Cidade criada com sucesso.'
    else
      render action: 'new'
    end
  end

  private

    def city_params
      params.require(:city).permit(:name)
    end
end
