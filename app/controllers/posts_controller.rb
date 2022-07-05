class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @posts = Post.all
  end

  def create
  end
end
