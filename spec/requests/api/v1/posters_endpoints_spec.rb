require "rails_helper"

describe "Posters API Endpoints" do
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
    # posters.each do |poster|
    #   expect(poster).to have_key(:id)
    #   expect(poster[:id]).to be_an(Integer)
      
    #   expect(poster[:attributes]).to have_key(:name)
    #   expect(poster[:attributes][:name]).to be_a(String)

    #   expect(poster[:attributes]).to have_key(:description)
    #   expect(poster[:attributes][:description]).to be_a(String)

    #   expect(poster[:attributes]).to have_key(:price)
    #   expect(poster[:attributes][:price]).to be_a(Float)

    #   expect(poster[:attributes]).to have_key(:year)
    #   expect(poster[:attributes][:year]).to be_a(Integer)

    #   expect(poster[:attributes]).to have_key(:vintage)
    #   expect(poster[:attributes][:vintage]).to be_in([true, false])

    #   expect(poster[:attributes]).to have_key(:img_url)
    #   expect(poster[:attributes][:img_url]).to be_a(String)
    # end
  end
  
  let(:poster) {Poster.first}
 
  it "can return one poster" do 

    get "/api/v1/posters/#{poster.id}"

    posters = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(posters).to have_key(:id)
    expect(posters[:id]).to eq(poster.id)

    expect(posters).to have_key(:name)
    expect(posters[:name]).to eq(poster.name)

    expect(posters).to have_key(:description)
    expect(posters[:description]).to eq(poster.description)

    expect(posters).to have_key(:price)
    expect(posters[:price]).to eq(poster.price)

    expect(posters).to have_key(:year)
    expect(posters[:year]).to eq(poster.year)

    expect(posters).to have_key(:vintage)
    expect(posters[:vintage]).to eq(poster.vintage)

    expect(posters).to have_key(:img_url)
    expect(posters[:img_url]).to eq(poster.img_url)

  end

  it "can create new poster" do
    poster_params = {
        poster: {
            name: "NEGLECT",
            description:  "Happiness is overrated.",
            price: 160.00,
            year: 2019,
            vintage: true,
            img_url:  "./assets/neglect.jpg"
        }
    }
    
    post "/api/v1/posters", params: poster_params

    created_poster = Poster.last
    expect(response).to be_successful
    expect(created_poster.name).to eq(poster_params[:poster][:name])
    expect(created_poster.description).to eq(poster_params[:poster][:description])
    expect(created_poster.price).to eq(poster_params[:poster][:price])
    expect(created_poster.year).to eq(poster_params[:poster][:year])
    expect(created_poster.vintage).to eq(poster_params[:poster][:vintage])
    expect(created_poster.img_url).to eq(poster_params[:poster][:img_url])
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
