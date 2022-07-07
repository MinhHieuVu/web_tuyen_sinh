class SchoolIndoController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    @school_info = School::SCHOOL_INFO[params[:id].to_sym]

    if @school_info.present?
      @schools = School.where(school_type: @school_info)
      if params[:province_id].present?
        @province = Province.friendly.find(params[:province_id])
        @schools = @schools.where(province_id: @province.id)
      end
    else
      redirect_to root_path
    end
  end
end