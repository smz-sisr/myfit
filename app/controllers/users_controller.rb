class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    if params[:gender].present?
       @users = @users.get_by_gender params[:gender]
    end
    if params[:age].present?
       @users = @users.get_by_age params[:age]
       p "ここが@usersです"
       p @users
       p "params[:age]です"
       p params[:age]
    end
    
  
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    p @user
    if @user != current_user
       redirect_to users_path, alert: '不正なアクセスです。'
    end
  end
  
  def update
    @user = User.find(params[:id])
      p "user_params =========="
      p user_params
      user_params_copy = user_params
      user_params_copy["gender"] = user_params_copy["gender"].to_i
      if @user.update!(user_params_copy)
          redirect_to user_path(@user), notice: '編集しました'
      else render :edit
      end
  end
  
  private
  def user_params
    params.require(:user).permit(:icon_image, :name, :age, :gender, :email, :height, :weight)
  end
end
