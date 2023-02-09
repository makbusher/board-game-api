class ReviewsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :find_game, only: [:create]
  
  def index 
    reviews = Review.all 
    render json: reviews.as_json
  end

  def create
    @review = Review.new(
      rating: params[:rating],
      description: params[:description],
      game_id: @game.id,
      user_id: @current_user.id
    )
    @review.save
  end

  def find_game
    @game = Game.find_by(id: params[:game_id])
  end
end
