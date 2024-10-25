class Poster < ApplicationRecord
  
  def self.poster_count 
    Poster.count
  end

  def self.sorted_and_filtered(params)
    posters = Poster.all
    posters = Poster.filter(posters, params)
    posters = Poster.sort(posters, params)
    posters
  end

  def self.sort(posters, params)
    if params[:sort] == "asc"
      posters.order(created_at: :asc)
    elsif params[:sort] == "desc"
      posters.order(created_at: :desc)
    else
      posters
    end
  end

  def self.filter(posters, params)
    posters = posters.where('name ILIKE ?', "%#{params[:name]}%").order(name: :asc) if params[:name].present?
    posters = posters.where('price >= ?', params[:min_price]) if params[:min_price].present?
    posters = posters.where('price <= ?', params[:max_price]) if params[:max_price].present?
    posters
  end
end