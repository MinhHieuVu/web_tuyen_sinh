class HomeController < ApplicationController

  def index
    @schools = School.all
    @provinces = Province.all
  end
  def school_index

  end

  def school_info_index

  end


end
