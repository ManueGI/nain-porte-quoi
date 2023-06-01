class DwarvesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_dwarf, only: [:show, :edit, :update, :destroy]

  def index
    @dwarves = Dwarf.all
    @markers = @dwarves.geocoded.map do |dwarf|
      {
        lat: dwarf.latitude,
        lng: dwarf.longitude,
        info_window_html: render_to_string(partial: "shared/info_window", locals: { dwarf: dwarf }),
        marker_html: render_to_string(partial: "shared/marker", locals: { dwarf: dwarf })
      }
    end
  end

  def show
    @rental = Rental.new
    @reserved = @dwarf.rentals.map do |rental|
      {
        from: rental.rental_begin,
        to: rental.rental_end
      }
    end
    @markers = [{ lat: @dwarf.latitude,
                  lng: @dwarf.longitude,
                  info_window_html: render_to_string(partial: "shared/info_window", locals: { dwarf: @dwarf }),
                  marker_html: render_to_string(partial: "shared/marker", locals: { dwarf: @dwarf })
                }]
    # raise
  end

  def new
    @dwarf = Dwarf.new
  end

  def create
    @dwarf = Dwarf.new(params_dwarf)
    @dwarf.user = current_user
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
    params.require(:dwarf).permit(:name, :description, :age, :address, :photo, :price)
  end

  def set_dwarf
    @dwarf = Dwarf.find(params[:id])
  end
end
