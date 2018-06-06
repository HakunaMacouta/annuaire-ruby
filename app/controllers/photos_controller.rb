class PhotosController < ApplicationController
  before_action :load_user
  before_action :load_photo, only: [:show, :edit, :update, :destroy]
  def index
    @photos = @user.photos
  end
  def update
    if @photo.update(photos_params)
      redirect_to [@user, @photo]
    else
      render 'edit'
    end
  end
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.new(photos_params)
	@photo.user_id = @user.id;
    if @photo.save
      redirect_to [@user, @photo]
    else
      render 'new'
    end
  end
  def load_photo
    @photo = @user.photos.find(params[:id])
  end
  def load_user
	@user = User.find(params[:user_id])
  end
  def destroy
    @photo.destroy
    redirect_to user_photos_path(@user, @photo)
  end
  def photos_params
    params.require(:photo).permit(:name, :file, :user_id)
  end
end
