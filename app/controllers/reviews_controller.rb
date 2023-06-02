class ReviewsController < ApplicationController
  before_action :set_rental, only: [:new, :create]
  # before_save :verify_user, only: [:create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.rental = @rental
    if current_user.id == @rental.user_id
      if @review.save
        redirect_to profile_path
      else
        redirect_to profile_path(error: "invalid-form", modal: "ReviewModal#{@review.rental.id}")
      end
    else
      redirect_to "/"
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :score)
  end

  def set_rental
    @rental = Rental.find(params[:rental_id])
  end
end
