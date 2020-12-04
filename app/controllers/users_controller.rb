class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.games.map { |game| game.reviews }.flatten
    @posts = @user.games.map { |game| game.posts }.flatten
    @avg_rating = @reviews.present? ? (@reviews.map { |review| review.rating }.flatten.sum / @reviews.count) : 0
    @orders = @user.games.map{|game| game.orders.length }.flatten
    @followers = @user.games.map{|game| game.followings.length }.flatten.sum
    @visit_counter = @user.games.map{|game| game.visit_counter }.flatten.sum
  end
end
