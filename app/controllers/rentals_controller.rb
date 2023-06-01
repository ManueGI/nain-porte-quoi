class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy, :accept, :refuse]
  def index
    @rentals = Rental.all
  end

  def show

  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(params_rental)
    @rental.rental_end = params[:rental][:rental_begin].split(" to ").last
    @user = current_user
    @dwarf = Dwarf.find(params[:dwarf_id])
    @rental.user = @user
    @rental.dwarf = @dwarf
    if @rental.save
      redirect_to profile_path
    else
      render "dwarves/show", status: :unprocessable_entity

    end
  end

  def edit
  end

  def update
    @rental.update(params_rental)
    redirect_to profile_path
  end

  def destroy
    @rental.destroy
    redirect_to profile_path
  end

  def accept
    @rental.accepted!
    redirect_to profile_path
  end

  def refuse
    @rental.refused!
    redirect_to profile_path
  end

  private

  def params_rental
    params.require(:rental).permit(:rental_begin)
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
