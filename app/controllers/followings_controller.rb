class FollowingsController < ApplicationController
  def index
    @followings = current_user.followings
  end

  def create
    @following = Following.new
    @game = Game.find(params[:game_id])
    @following.game = @game
    @following.user = current_user
    @following.save
  end

  def destroy
    @following = Following.find(params[:id])
    @following.destroy
  end
end
