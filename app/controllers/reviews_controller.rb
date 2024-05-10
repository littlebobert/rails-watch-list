class ReviewsController < ApplicationController
  def create
    @review = Review.new(strong_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new
      render "lists/show", status: :unprocessable_entity
    end
  end

  private

  def strong_params
    params.require(:review).permit(:comment, :rating)
  end
end
