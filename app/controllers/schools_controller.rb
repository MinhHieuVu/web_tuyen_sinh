class SchoolsController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @current_year = 2021
    @school = School.friendly.find(params[:id])
  end
end