class BoatsController < ApplicationController

  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save
      redirect_to boats_path
    else
      # バリデーションに合わせてエラーをjsonで返す
      if @boat.errors
        errors = []
        @boat.errors.messages.each do |key, value|
          error = key.to_s + value[0]
          errors << error
        end
        render json: {errors: errors}
      end
    end
  end

  def edit

  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      render json: @boat
    else
      # バリデーションに合わせてエラーをjsonで返す
      if @boat.errors
        errors = []
        @boat.errors.messages.each do |key, value|
          error = key.to_s + value[0]
          errors << error
        end
        render json: {errors: errors}
      end
    end
  end

  def destroy
  end

private

def boat_params
  params.require(:boat).permit(:id, :name, :address, :image)
end

end
