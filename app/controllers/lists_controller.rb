class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def strong_params
    params.require(:list).permit(:name, :photo)
  end
end
