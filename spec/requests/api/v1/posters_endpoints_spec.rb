require "rails_helper"

describe "Posters API Endpoints" do
  before(:each) do 
   poster_1 = Poster.create(
      name: "Head",
      description: "The top of a body",
      price: 100.00,
      year: 2000,
      vintage: false,
      img_url: "https://yanksmannequins.com/1181-small_default/mannequin-head-h37.jpg"
    )
      
    poster_2 = Poster.create(
      name: "Torso",
      description: "The middle of a body",
      price: 75.00,
      year: 2001,
      vintage: false,
      img_url: "https://yanksmannequins.com/955-small_default/small-mannequin-military-torso-ww2-ww1-half-body-tailor-form.jpg"
    )
        
    poster_3 = Poster.create(
      name: "Legs",
      description: "The bottom part of a body",
      price: 50.00,
      year: 1927,
      vintage: true,
      img_url: "https://thumbs.dreamstime.com/b/long-men-legs-isolated-human-pins-feet-long-men-legs-isolated-human-pins-feet-133667921.jpg"
    )
  end
        
  it "can retrieve all posters (index action)" do
    get '/api/v1/posters'

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)

    expect(posters.count).to eq(3)

    posters.each do |poster|
      expect(poster).to have_key(:id)
      expect(poster[:id]).to be_an(Integer)

      expect(poster).to have_key(:name)
      expect(poster[:name]).to be_a(String)

      expect(poster).to have_key(:description)
      expect(poster[:description]).to be_a(String)

      expect(poster).to have_key(:price)
      expect(poster[:price]).to be_a(Float)

      expect(poster).to have_key(:year)
      expect(poster[:year]).to be_a(Integer)

      expect(poster).to have_key(:vintage)
      expect(poster[:vintage]).to be_in([true, false])

      expect(poster).to have_key(:img_url)
      expect(poster[:img_url]).to be_a(String)
    end
  end
  
  it "can return one poster" do 
   
    get "api/v1/posters/#{poster_1.id}"

    expect(response).to be_successful

    expect(poster_response).to have_key(:id)
    expect(poster_response[:id]).to eq(song_1.id)

    expect(poster_response).to have_key(:name)
    expect(poster_response[:name]).to eq(poster_1.name)

    expect(poster_response).to have_key(:description)
    expect(poster_response[:description]).to eq(poster_1.description)

    expect(poster_response).to have_key(:price)
    expect(poster_response[:price]).to eq(poster_1.price)

    expect(poster_response).to have_key(:year)
    expect(poster_response[:year]).to eq(poster_1.year)

    expect(poster_response).to have_key(:vintage)
    expect(poster_response[:vintage]).to eq(poster_1.vintage)

    expect(poster_response).to have_key(:img_url)
    expect(poster_response[:img_url]).to eq(poster_1.img_url)

  end
  it "can update an existing poster" do
    poster = Poster.first
    id = poster.id
    previous_name = poster.name
    poster_params = { name: "More than just a face" }
    headers = { "CONTENT_TYPE" => "application/json"}

    patch "/api/v1/posters/#{id}", headers: headers, params: JSON.generate( { poster: poster_params } )

    updated_poster = Poster.find_by(id: id)

    expect(response).to be_successful
    expect(updated_poster.name).to_not eq(previous_name)
    expect(updated_poster.name).to eq("More than just a face")
  end
end
