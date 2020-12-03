class RepliesController < ApplicationController
  def create
    @reply = Reply.new(reply_params)
    @reply.user = current_user
    @reply.post = Post.find(params[:post_id])
    match_data = @reply.content.match(/@(\w+)/)
    if match_data
      @reply.content = @reply.content.gsub(match_data[0], "<a href='/games/26'>#{match_data[0]}</a> ")
    end

    if @reply.save
      if @reply.post.category == "discussion"
        redirect_to discussion_game_posts_path(@reply.post.game, anchor: "reply-#{@reply.id}")
      else
        redirect_to game_path(@reply.post.game, anchor: "reply-#{@reply.id}")
      end
    else
      flash[:error] = "Something went wrong try again please!" #flashed to the user an error message if it doesn't save
      redirect_to request.referer
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
