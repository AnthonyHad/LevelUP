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
      redirect_to posts_path, notice: "Post was succesfully created."
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
    @devlog = @game.posts.where(category: "devlog")
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end
