class ReviewsController < ApplicationController
  before_action :authenticate_user, only: [:create]
  before_action :find_game

  def index 
    @reviews = Review.where(:game_id => @game.id) 
    render template: "reviews/index"
  end

  def show
    review = Review.find_by(id: params[:id])
    render json: review.as_json
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
