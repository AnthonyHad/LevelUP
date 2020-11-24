class RepliesController < ApplicationController
  def create
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
