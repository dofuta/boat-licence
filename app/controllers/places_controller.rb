class PlacesController < ApplicationController
  def index
    @place = Place.new
    @places = Place.all
  end

  def create
    Place.create(place_params)
    redirect_to places_path
    flash[:notice] = "作成しました！"
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    Place.update(place_params)
    redirect_to places_path
    flash[:notice] = "更新しました！"
  end

  def destroy
    Place.find(params[:id]).destroy
    redirect_to places_path
    flash[:notice] = "削除しました！"
  end

  private
  def place_params
    params.require(:place).permit(:facility_name, :address, :map_image, :url)
  end
end
