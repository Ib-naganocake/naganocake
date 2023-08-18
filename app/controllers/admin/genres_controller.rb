class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "You have created genre successfully."
    else
      @genre = Genre.new
      @genres = Genre.page(params[:page])
      redirect_to admin_genres_path, notice: "Failed to create genre."
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "You have updated genre successfully."
    else
      redirect_to edit_admin_genre_path(@genre), notice: "Failed to update genre."
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
