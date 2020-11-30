class ReviewsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @game = Game.find(params[:game_id])
    @review.game = @game
    @review.user = current_user
    if @review.save
      redirect_to game_reviews_path(@game)
    else
      render :new
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
