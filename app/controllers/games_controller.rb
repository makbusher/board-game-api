class GamesController < ApplicationController
  def index 
    @games = Game.all
    render json: @games.as_json
  end

  def show 
    game = Game.find_by(id: params[:id])
    render json: game.as_json
  end
end

