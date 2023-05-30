class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @dwarves = current_user.dwarves
    @rented_dwarves = current_user.rented_dwarves
  end
end
