class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    raise
    @review = Review.new(params_review)
    @dwarf.user = current_user
    if @review.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :score)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
