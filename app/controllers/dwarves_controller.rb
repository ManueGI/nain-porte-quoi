class DwarvesController < ApplicationController
  before_action :set_dwarf, only: [:show, :edit, :update, :destroy]
  def index
    @dwarves = Dwarf.all
  end

  def show
    @rental = Rental.new
    @user = current_user
    @rental.user = @user
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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @dwarf.update(params_dwarf)
    redirect_to profile_path
  end

  def destroy
    @dwarf.destroy
    redirect_to profile_path
  end

  private

  def params_dwarf
    params.require(:dwarf).permit(:name, :description, :age, :address)
  end

  def set_dwarf
    @dwarf = Dwarf.find(params[:id])
  end
end
