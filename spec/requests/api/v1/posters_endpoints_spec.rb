require "rails_helper"

describe "Posters API Endpoints" do
  it "can retrieve all posters (index action)" do

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
        expect(poster[:vintage]).to be_a(Boolean)

        expect(poster).to have_key(:img_url)
        expect(poster[:img_url]).to be_a(String)
      end
  end
end