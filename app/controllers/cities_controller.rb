class CitiesController < ApplicationController
  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.user = current_user

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
