class PostsController < ApplicationController
  before_action :authenticate_user! 
  def index
    @posts = Post.all.order(created_at: :desc)
     @users = User.all
    if params[:gender].present?
       @users = @users.get_by_gender params[:gender]
    end
    if params[:age].present?
       @users = @users.get_by_age params[:age]
    end
    
    @posts = @users.map{|user|user.posts}.flatten
    
  end
  

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_user.comments.new
   
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: '投稿しました'
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
       redirect_to posts_path(@post), alert: '不正なアクセスです。'
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '編集しました'
    else
      render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end
  
  private
  def post_params
    params.require(:post).permit(:date, :meal_content, :training_content, :weight)
  end
  
end
