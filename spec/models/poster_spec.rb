require "rails_helper"

describe "Posters" do
  before(:each) do 
    Poster.create(
      name: "Head",
      description: "The top of a body",
      price: 100.00,
      year: 2000,
      vintage: false,
      img_url: "https://yanksmannequins.com/1181-small_default/mannequin-head-h37.jpg"
    )
      
    Poster.create(
      name: "Torso",
      description: "The middle of a body",
      price: 75.00,
      year: 2001,
      vintage: false,
      img_url: "https://yanksmannequins.com/955-small_default/small-mannequin-military-torso-ww2-ww1-half-body-tailor-form.jpg"
    )
        
    Poster.create(
      name: "Legs",
      description: "The bottom part of a body",
      price: 50.00,
      year: 1927,
      vintage: true,
      img_url: "https://thumbs.dreamstime.com/b/long-men-legs-isolated-human-pins-feet-long-men-legs-isolated-human-pins-feet-133667921.jpg"
    )
  end

  describe 'poster count' do
    it 'counts the total number of posters' do
      expect(Poster.poster_count).to eq(3)
    end
  end

  describe 'sorting of posters' do
    it 'sorts the posters from first to last using the value of created at' do
     sorted_posters = Poster.sort(sort:("asc"))

      expect(sorted_posters.first[:name]).to eq("Head")
      expect(sorted_posters.last[:name]).to eq("Legs")
    end

    it 'sorts the posters from last to first using the value of created at' do
      sorted_posters = Poster.sort(sort:("desc"))
      
      expect(sorted_posters.first[:name]).to eq("Legs")
      expect(sorted_posters.last[:name]).to eq("Head")
    end
  end

  describe 'filtering posters' do
    it 'can filter posters using case-insensitive search query' do
      filtered_posters = Poster.filter(name: "t")
      
      expect(filtered_posters.map(&:name)).to include("Torso")
      expect(filtered_posters.map(&:name)).to_not include("Head")
      expect(filtered_posters.map(&:name)).to_not include("Legs")
    end

    it 'can filter posters by minimum price search query' do
      filtered_posters = Poster.filter(min_price: 73.00)

      expect(filtered_posters.count).to eq(2)

      expect(filtered_posters.map(&:name)).to include("Head")
      expect(filtered_posters.map(&:name)).to include("Torso")
      expect(filtered_posters.map(&:name)).to_not include("Legs")
    end

    xit 'can filter posters by maximum price search query' do
      filtered_posters = Poster.filter(max_price: 73.00)

      expect(filtered_posters.count).to eq(1)

      expect(filtered_posters.map(&:name)).to include("Legs")
      expect(filtered_posters.map(&:name)).to_not include("Head")
      expect(filtered_posters.map(&:name)).to_not include("Torso")
    end
  end
end

