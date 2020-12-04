class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:discussion, :devlogs]

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
      elsif @post.category == "devlog"
        redirect_to devlogs_game_posts_path, notice: "Devlog post was succesfully created."
      else
        redirect_to game_path(@game, anchor: "anchor-for-posts"), notice: "Post was succesfully created."
      end
    else
      render :new
    end
  end

  def discussion
    @post = Post.new
    @game = Game.find(params[:game_id])
    @discussion = @game.posts.where(category: "discussion")
  end

  def devlogs
    @post = Post.new
    @game = Game.find(params[:game_id])
    @devlogs = @game.posts.where(category: "devlog")
  end

  def destroy
    # @game = Game.find(params[:game_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to game_path(@post.game), notice: "Post was succesfully deleted."
  end

  def like
    @post = Post.find(params[:id])
    @post.liked_by current_user
  end

  def update_counter
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: { likes: @post.get_likes } }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category, :photo)
  end
end
