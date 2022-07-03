class HomeController < ApplicationController
  def index
    @provinces = Province.all
    @schools = School.all
  end
  def school_index
    @schools = School.all
    @provinces = Province.all
  end

  def school_info_index
    @schools = School.all
    @school_infos = SchoolInfo.all
  end

end
