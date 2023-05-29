class DwarvesController < ApplicationController
  before_action :set_dwarf, only: [:show, :edit, :update, :destroy]
  def index
    @dwarves = Dwarf.all
  end

  def show
    @dwarf = Dwarf.find(params[:id])
  end

  def new
    @dwarf = Dwarf.new
  end

  def create
    @dwarf = Dwarf.new(params_dwarf)
    @user = User.find(params[:user_id])
    @dwarf.user = @user
    if @dwarf.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def params_dwarf
    params.require(:dwarf).permit(:name, :description, :age, :address)
  end

  def set_dwarf
    @dwarf = Dwarf.find(params[:id])
  end
end
