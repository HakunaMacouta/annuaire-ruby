class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  def index
		@users = User.all.order(:first_name)
  end
  def update
	if @user.update(user_params)
	  redirect_to user_path(@user)
	else
	  render 'edit'
	end
  end
  def new
	@user = User.new
  end
  def create
	@user = User.new(user_params)
	if @user.save
	  redirect_to user_path(@user)
	else
	  render 'new'
	end
  end
  def load_user
	@user = User.find(params[:id])
  end
  def destroy
	@user.destroy
	redirect_to users_path
  end
  def user_params
	params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :date_of_birth)
  end
end
