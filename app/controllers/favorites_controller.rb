class FavoritesController < ApplicationController
  def index 
    @favorites = Favorite.where(user_id: current_user.id)
    render template: "favorites/index"
  end
  
  def create
    favorite = Favorite.create(
      user_id: params[:user_id],
      game_id: params[:game_id]
    )
    render json: favorite.as_json
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
    render json: { message: "Deleted Successfully" }
  end
end
