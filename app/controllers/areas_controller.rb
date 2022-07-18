class AreasController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @area = Area.friendly.find(params[:id])
  end

end