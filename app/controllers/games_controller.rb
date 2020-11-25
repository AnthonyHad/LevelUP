class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @games = Game.all
    if params[:query].present?
      @games = Game.search_by_title_and_description_and_category(params[:query])
    end
  end

  def show
    @game = Game.find(params[:id])
    @posts = @game.posts.where(category: 'post')
    @post = Post.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(games_params)
    @game.user = current_user
    if @game.save
      redirect_to @game, notice: "Game was succesfully created."
    else
      render :new
    end
  end

  private

  def games_params
    params.require(:game).permit(:title, :description, :category, photos: [])
  end
end
