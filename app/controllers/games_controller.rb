class GamesController < ApplicationController
  def index
  end

  def show
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
