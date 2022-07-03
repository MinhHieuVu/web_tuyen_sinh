class Admin::ProvincesController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_province, only: [:show, :edit, :update, :destroy]

  # GET /provinces or /provinces.json
  def index
    @provinces = Province.all
  end

  # GET /provinces/1 or /provinces/1.json
  def show
    @province = Province.friendly.find(params[:id])
  end

  # GET /provinces/new
  def new
    @province = Province.new
  end

  # GET /provinces/1/edit
  def edit
  end

  # POST /provinces or /provinces.json
  def create
    @province = Province.new(province_params)

    respond_to do |format|
      if @province.save
        format.html { redirect_to admin_province_url(@province), notice: "Province was successfully created." }
        format.json { render :show, status: :created, location: @province }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @province.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provinces/1 or /provinces/1.json
  def update
    respond_to do |format|
      if @province.update(province_params)
        format.html { redirect_to admin_province_url(@province), notice: "Province was successfully updated." }
        format.json { render :show, status: :ok, location: @province }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @province.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provinces/1 or /provinces/1.json
  def destroy
    @province.destroy
    respond_to do |format|
      format.html { redirect_to admin_provinces_url, notice: "Province was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_province
      @province = Province.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def province_params
      params.require(:province).permit(:name, :description)
    end
end
