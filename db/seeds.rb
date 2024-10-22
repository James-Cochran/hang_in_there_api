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
