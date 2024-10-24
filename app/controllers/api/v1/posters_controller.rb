class Api::V1::PostersController < ApplicationController
  def index
    posters = Poster.all
    render json: posters #posters #PosterSerializer.format_posters(posters)
  end
  
   def show 
    poster = Poster.find(params[:id])
    render json: poster
  end

  def create
    created_poster = Poster.create(poster_params)
    render json: created_poster
  end

  def update
    updated_poster = Poster.update(params[:id], poster_params)
    render json: updated_poster #PosterSerializer.format_posters(updated_poster)
  end

  private

  def poster_params
    params.require(:poster).permit(:name, :description, :price, :year, :vintage, :img_url)
  end

  def update
    updated_poster = Poster.update(params[:id], poster_params)
    render json: updated_poster #PosterSerializer.format_posters(updated_poster)
  end

  def destroy
    poster = Poster.find(params[:id])
    poster.destroy
    head  :no_content
  end

  private

  def poster_params
    params.require(:poster).permit(:name, :description, :price, :year, :vintage, :img_url)
  end
end