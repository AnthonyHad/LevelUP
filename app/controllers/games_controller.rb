class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
  end

  def create
  end

  private

  def games_params
    params.require(:game).permit(:title, :description, :category)
  end
end
