class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:hide_welcome]
      session[:hide_welcome] = true
    end
    if params[:search].present?
      search = params[:search]
      if search[:platform].last.present? && search[:price].present?
        @games = Game.where("price_cents < ?", search[:price].to_i).select do |game|
          game.platform_ids.select do |id|
            search[:platform].include?("#{id}")
          end.present?
        end
        # @games = Game.where(platform: search[:platform]).where("price_cents < ?", search[:price].to_i)
      elsif search[:platform].last.empty?
        @games = Game.where("price_cents < ?", search[:price].to_i)
      elsif search[:platform].last.present?
        # @games = Game.joins(:games_platforms).where(platform_id: search[:platform])
        @games = Game.all.select do |game|
          game.platform_ids.select do |id|
            search[:platform].include?("#{id}")
          end.present?
        end
        # @games = Game.where(platform: search[:platform])
      else
        @games = Game.all
      end
    elsif params[:query].present?
      @games = Game.search_by_title_and_description_and_category(params[:query])
    else
      @games = Game.all
    end

    # .paginate(page: params[:page], per_page: 12)

      # elsif search[:platform].length > 2 && !search[:price].last.empty?
      #   @games = (Game.where(platform: search[:platform][1]).and(Game.where(platform: search[:platform][2]))).where("price_cents < ?", search[:price].last.to_i)

    # elsif params[:platform].present?
    #   @games = @games.where(platform: params[:platform])
    # elsif params[:price_cents].present?
    #   if params[:price_cents] == "£10 or less"
    #     @games = @games.where("price_cents < ?",1000)
    #   end
    # end
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
    params.require(:game).permit(:title, :description, :category, :price, platform_ids: [], photos: [])
  end
end
