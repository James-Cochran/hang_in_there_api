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

  def self.filter(params)
    posters = Poster.all
    posters = posters.where('name ILIKE ?', "%#{params[:name]}%").order(name: :asc) if params[:name].present?
    posters = posters.where('price >= ?', params[:min_price]) if params[:min_price].present?
    posters = posters.where('price <= ?', params[:max_price]) if params[:max_price].present?
    posters
  end
end