class FavoritesController < ApplicationController
  before_action :authenticate_user
  before_action :find_game, only: [:create]

  def index 
    @favorites = Favorite.where(user_id: current_user.id)
    render template: "favorites/index"
  end

  def show 
    @favorite = Favorite.find_by(id: params[:id])
    if current_user.id == @favorite.user_id
      render template: "favorites/show"
    else 
      render json: {}, status: unauthorized
    end
  end
  
  def create
    current_user.favorites.each do |favorite|
      if @game.id != favorite.game_id
        favorite = Favorite.create(
          user_id: current_user.id,
          game_id: @game.id
        )
        render json: favorite.as_json
      else
        render json: {message: "Already added to favorites"}
      end
    end
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
    render json: { message: "Deleted Successfully" }
  end

  private 
    def find_game
      @game = Game.find_by(id: params[:game_id])
    end
end
