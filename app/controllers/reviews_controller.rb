class ReviewsController < ApplicationController
  def create
    review = clinic.reviews.create(review_params)
    respond_with clinic, review 
  end

  def upvote
    review = clinic.reviews.find(params[:id])
    review.increment!(:upvotes)

    respond_with clinic, review
  end


private

  def reviews_params
    params.require(:review).permit(:body)
  end
end
