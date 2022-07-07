class ProvincesController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @province = Province.friendly.find(params[:id])
  end
end