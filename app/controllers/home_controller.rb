class HomeController < ApplicationController
  def index
    @provinces = Province.all
  end
  def school_index
    @schools = School.all
  end
end
