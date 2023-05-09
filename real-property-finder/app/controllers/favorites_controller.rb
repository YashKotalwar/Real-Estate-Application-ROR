class FavoritesController < ApplicationController
  before_action :authenticate_account!

  def create
    @property = Property.find(params[:property_id])
    current_account.favorite_properties << @property
    redirect_to properties_path, notice: "Added to favorites"
  end
  def index
    @properties = current_account.favorite_properties
  end
  def destroy
    @property = Property.find(params[:id])
    current_account.favorite_properties.destroy(@property)
    redirect_to properties_path, notice: "Removed from favorites"
  end

end
