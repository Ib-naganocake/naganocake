class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの追加に成功しました。"
      flash[:color] = "text-success"
      redirect_to admin_genres_path
    else
      flash[:notice] = "ジャンルの追加に失敗しました。"
      flash[:color] = "text-danger"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの編集に成功しました。"
      flash[:color] = "text-success"
      redirect_to admin_genres_path
    else
      flash[:notice] = "ジャンルの編集に失敗しました。"
      flash[:color] = "text-danger"
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
