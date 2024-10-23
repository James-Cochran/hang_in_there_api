# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Poster.create(
              name: "REGRET",
              description: "Hard work rarely pays off.",
              price: 89.00,
              year: 2018,
              vintage: true,
              img_url:  "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d"
)

Poster.create(
                name: "HOPELESSNESS",
                description: "Stay in your comfort zone; it's safer.",
                price: 112.00,
                year: 2020,
                vintage: true,
                img_url: "https://images.unsplash.com/photo-1620330299271-aa59b307da00?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9wZWxlc3NuZXNzfGVufDB8fDB8fHww"
)

Poster.create(
              name: "PROCRASTINATION",
              description: "Better to avoid failure by not trying at all.",
              price: 48.00,
              year: 2017,
              vintage: true,
              img_url: "https://images.unsplash.com/photo-1644329771909-b651e30c41da?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvY3Jhc3RpbmF0aW9ufGVufDB8fDB8fHww"
)

Poster.create(
              name: "NEGLECT",
              description: "Happiness is overrated.",
              price: 160.00,
              year: 2019,
              vintage: true,
              img_url: "https://images.unsplash.com/photo-1617400372783-71e460f3fcc1?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG5lZ2xlY3R8ZW58MHx8MHx8fDA%3D"
)

Poster.create(
              name: "FEAR",
              description: "Giving up is always an option.",
              price: 91.00,
              year: 2014,
              vintage: false,
              img_url: "https://media.istockphoto.com/id/1970353806/photo/man-walking-at-foggy-forest-in-the-morning.webp?a=1&b=1&s=612x612&w=0&k=20&c=BcW6LR2ngXaFkCBML_oRuo0O1JgC6JjWTzwxVE1V4kk="
)

Poster.create(
              name: "DOUBT",
              description: "Success is for other people, not you.",
              price: 140.00,
              year: 2020,
              vintage: false,
              img_url: "https://images.unsplash.com/photo-1693035477914-29b107f0a3d8?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGRvdWJ0fGVufDB8fDB8fHww"
)

