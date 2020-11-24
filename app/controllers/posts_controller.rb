class PostsController < ApplicationController
  def new
  end

  def create
  end

  def discussion
  end

  def devlogs
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category)
  end
end
