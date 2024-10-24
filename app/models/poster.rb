class Poster < ApplicationRecord
  
  def self.poster_count 
    Poster.count
  end

  def self.sort(params)
    if params[:sort] == "asc"
      Poster.order(created_at: :asc)
    elsif params[:sort] == "desc"
      Poster.order(created_at: :desc)
    else
      Poster.all
    end
  end

end