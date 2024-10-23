class PosterSerializer #< ActiveModel::Serializer
  # attributes :id, :name, :description, :price, :year, :vintage, :img_url

    def self.format_posters(posters)
      posters.map do |poster|
          {
            id: poster.id,
            type: "poster",
            attributes: {
              name: poster.name,
              description: poster.description,
              price: poster.price,
              year: poster.year,
              vintage: poster.vintage,
              img_url: poster.img_url
            }
          } 
        end
    end
end