class HomeController < ApplicationController

  def index
    @schools = School.all
    @provinces = Province.all
  end
  def school_index

  end

  def school_info_index

  end
  def province_index

  end

  def area_index

  end

end
