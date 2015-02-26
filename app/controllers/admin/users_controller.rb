class  Admin::UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user , only: :destroy

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end
  
  def show
    @user = User.find params[:id]
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to admin_users_path
  end

  def create
    @user = User.new params_user
    if @user.save
      flash[:success] = "created new user" + @user.name 
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params_user
      flash[:success] = "Profile updated"
      redirect_to  admin_user_path(@user)
    else
      render :edit
    end
  end
  
  private
  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation , :admin)
  end
end