class ReviewsController < ApplicationController

  def create
    @review = current_user.reviews.create(review_params)
    redirect_to @review.location
  end

  def destroy
    @review = Review.find(params[:id])
    location = @review.location
    @review.destroy

    redirect_to location
  end

  private
    def review_params
      params.require(:review).permit(:comment, :rate, :location_id)
    end
end
