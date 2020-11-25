class PostsController < ApplicationController
  def new
    @post = Post.new
    @game = Game.find(params[:game_id])
  end

  def create
    @post = Post.new(post_params)
    @game = Game.find(params[:game_id])
    @post.game = @game
    @post.user = current_user
    if @post.save
      if @post.category == "discussion"
        redirect_to discussion_game_posts_path, notice: "Discussion post was succesfully created."
      else
        redirect_to devlogs_game_posts_path, notice: "Devlog post was succesfully created."
      end
    else
      render :new
    end
  end

  def discussion
    @game = Game.find(params[:game_id])
    @discussion = @game.posts.where(category: "discussion")
  end

  def devlogs
    @game = Game.find(params[:game_id])
    @devlogs = @game.posts.where(category: "devlog")
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category, :photo)
  end
end
