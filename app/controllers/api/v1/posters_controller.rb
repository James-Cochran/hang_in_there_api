class Api::V1::PostersController < ApplicationController
  def index
    posters = Poster.all
    render json: posters #PosterSerializer.format_posters(posters)
  end
end