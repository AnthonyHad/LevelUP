class RepliesController < ApplicationController
  def create
    @reply = Reply.new(reply_params)
    @reply.user = current_user
    @reply.post = Post.find(params[:post_id])

    if @reply.save
      redirect_to game_path(@reply.post.game, anchor: "reply-#{@reply.id}")

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
