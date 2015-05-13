class UserController < ApplicationController

  before_action :find_user, only: [:show, :destroy, :update]

  def index
    @users = User.all.sort.page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_index_path
    else
      flash[:error] = user.errors.messages
      redirect_to :back
    end
  end

  def update

    if @user.update_attributes(user_params)
      flash[:notice] = "Update success"
      redirect_to :back
    else
      flash[:error] = @user.errors.messages
      redirect_to :back
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = "Delete success"
      redirect_to :back
    end
  end

  private

  def find_user
    begin
      @user = User.find(params[:id])
    rescue
      redirect_to user_index_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone)
  end
end
