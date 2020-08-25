# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveViewStudio.Repo.insert!(%LiveViewStudio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveViewStudio.Repo
alias LiveViewStudio.Boats.Boat
alias LiveViewStudio.Stores.Store
alias LiveViewStudio.Flights.Flight

%Boat{
  model: "1760 Retriever Jon Deluxe",
  price: "$",
  type: "fishing",
  image: "/images/boats/1760-retriever-jon-deluxe.jpg"
}
|> Repo.insert!()

%Boat{
  model: "1650 Super Hawk",
  price: "$",
  type: "fishing",
  image: "/images/boats/1650-super-hawk.jpg"
}
|> Repo.insert!()

%Boat{
  model: "1850 Super Hawk",
  price: "$$",
  type: "fishing",
  image: "/images/boats/1850-super-hawk.jpg"
}
|> Repo.insert!()

%Boat{
  model: "1950 Super Hawk",
  price: "$$",
  type: "fishing",
  image: "/images/boats/1950-super-hawk.jpg"
}
|> Repo.insert!()

%Boat{
  model: "2050 Authority",
  price: "$$$",
  type: "fishing",
  image: "/images/boats/2050-authority.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Deep Sea Elite",
  price: "$$$",
  type: "fishing",
  image: "/images/boats/deep-sea-elite.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Beneteau First 14",
  price: "$$",
  type: "sailing",
  image: "/images/boats/beneteau-first-14.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Beneteau First 24",
  price: "$$$",
  type: "sailing",
  image: "/images/boats/beneteau-first-24.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Beneteau Oceanis 31",
  price: "$$$",
  type: "sailing",
  image: "/images/boats/beneteau-oceanis-31.jpg"
}
|> Repo.insert!()

%Boat{
  model: "RS Quest",
  price: "$",
  type: "sailing",
  image: "/images/boats/rs-quest.jpg"
}
|> Repo.insert!()

%Boat{
  model: "RS Feva",
  price: "$",
  type: "sailing",
  image: "/images/boats/rs-feva.jpg"
}
|> Repo.insert!()

%Boat{
  model: "RS Cat 16",
  price: "$$",
  type: "sailing",
  image: "/images/boats/rs-cat-16.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Yamaha SX190",
  price: "$",
  type: "sporting",
  image: "/images/boats/yamaha-sx190.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Yamaha 212X",
  price: "$$",
  type: "sporting",
  image: "/images/boats/yamaha-212x.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Glastron GT180",
  price: "$",
  type: "sporting",
  image: "/images/boats/glastron-gt180.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Glastron GT225",
  price: "$$",
  type: "sporting",
  image: "/images/boats/glastron-gt225.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Yamaha 275E",
  price: "$$$",
  type: "sporting",
  image: "/images/boats/yamaha-275e.jpg"
}
|> Repo.insert!()

%Boat{
  model: "Yamaha 275SD",
  price: "$$$",
  type: "sporting",
  image: "/images/boats/yamaha-275sd.jpg"
}
|> Repo.insert!()



%Store{
  name: "Downtown Helena",
  street: "312 Montana Avenue",
  phone_number: "406-555-0100",
  city: "Helena, MT",
  zip: "59602",
  open: true,
  hours: "8am - 10pm M-F"
}
|> Repo.insert!()

%Store{
  name: "East Helena",
  street: "227 Miner's Lane",
  phone_number: "406-555-0120",
  city: "Helena, MT",
  zip: "59602",
  open: false,
  hours: "8am - 10pm M-F"
}
|> Repo.insert!()

%Store{
  name: "Westside Helena",
  street: "734 Lake Loop",
  phone_number: "406-555-0130",
  city: "Helena, MT",
  zip: "59602",
  open: true,
  hours: "8am - 10pm M-F"
}
|> Repo.insert!()

%Store{
  name: "Downtown Denver",
  street: "426 Aspen Loop",
  phone_number: "303-555-0140",
  city: "Denver, CO",
  zip: "80204",
  open: true,
  hours: "8am - 10pm M-F"
}
|> Repo.insert!()

%Store{
  name: "Midtown Denver",
  street: "7 Broncos Parkway",
  phone_number: "720-555-0150",
  city: "Denver, CO",
  zip: "80204",
  open: false,
  hours: "8am - 10pm M-F"
}
|> Repo.insert!()

%Store{
  name: "Denver Stapleton",
  street: "965 Summit Peak",
  phone_number: "303-555-0160",
  city: "Denver, CO",
  zip: "80204",
  open: true,
  hours: "8am - 10pm M-F"
}
|> Repo.insert!()

%Store{
  name: "Denver West",
  street: "501 Mountain Lane",
  phone_number: "720-555-0170",
  city: "Denver, CO",
  zip: "80204",
  open: true,
  hours: "8am - 10pm M-F"
}
|> Repo.insert!()



use Timex

%Flight{
  number: "450",
  origin: "DEN",
  destination: "ORD",
  departure_time: Timex.shift(Timex.now(), days: 1),
  arrival_time: Timex.shift(Timex.now(), days: 1, hours: 2)
}
|> Repo.insert!()

%Flight{
  number: "450",
  origin: "DEN",
  destination: "ORD",
  departure_time: Timex.shift(Timex.now(), days: 2),
  arrival_time: Timex.shift(Timex.now(), days: 2, hours: 2)
}
|> Repo.insert!()

%Flight{
  number: "450",
  origin: "DEN",
  destination: "ORD",
  departure_time: Timex.shift(Timex.now(), days: 3),
  arrival_time: Timex.shift(Timex.now(), days: 3, hours: 2)
}
|> Repo.insert!()

%Flight{
  number: "860",
  origin: "DFW",
  destination: "ORD",
  departure_time: Timex.shift(Timex.now(), days: 1),
  arrival_time: Timex.shift(Timex.now(), days: 1, hours: 3)
}
|> Repo.insert!()

%Flight{
  number: "860",
  origin: "DFW",
  destination: "ORD",
  departure_time: Timex.shift(Timex.now(), days: 2),
  arrival_time: Timex.shift(Timex.now(), days: 2, hours: 4)
}
|> Repo.insert!()

%Flight{
  number: "860",
  origin: "DFW",
  destination: "ORD",
  departure_time: Timex.shift(Timex.now(), days: 2),
  arrival_time: Timex.shift(Timex.now(), days: 2, hours: 4)
}
|> Repo.insert!()

%Flight{
  number: "740",
  origin: "DAB",
  destination: "DEN",
  departure_time: Timex.shift(Timex.now(), days: 1),
  arrival_time: Timex.shift(Timex.now(), days: 1, hours: 4)
}
|> Repo.insert!()

%Flight{
  number: "740",
  origin: "DAB",
  destination: "DEN",
  departure_time: Timex.shift(Timex.now(), days: 2),
  arrival_time: Timex.shift(Timex.now(), days: 2, hours: 4)
}
|> Repo.insert!()


alias LiveViewStudio.GitRepos.GitRepo

%GitRepo{
  name: "elixir",
  url: "https://github.com/elixir-lang/elixir",
  owner_login: "elixir-lang",
  owner_url: "https://github.com/elixir-lang",
  fork: false,
  stars: 16900,
  language: "elixir",
  license: "apache"
}
|> Repo.insert!()

%GitRepo{
  name: "phoenix",
  url: "https://github.com/phoenixframework/phoenix",
  owner_login: "phoenixframework",
  owner_url: "https://github.com/phoenixframework",
  fork: false,
  stars: 15200,
  language: "elixir",
  license: "mit"
}
|> Repo.insert!()

%GitRepo{
  name: "phoenix_live_view",
  url: "https://github.com/phoenixframework/phoenix_live_view",
  owner_login: "phoenixframework",
  owner_url: "https://github.com/phoenixframework",
  fork: false,
  stars: 3000,
  language: "elixir",
  license: "mit"
}
|> Repo.insert!()

%GitRepo{
  name: "phoenix_live_view",
  url: "https://github.com/clarkware/phoenix_live_view",
  owner_login: "clarkware",
  owner_url: "https://github.com/clarkware",
  fork: true,
  stars: 0,
  language: "elixir",
  license: "mit"
}
|> Repo.insert!()

%GitRepo{
  name: "rails",
  url: "https://github.com/rails/rails",
  owner_login: "rails",
  owner_url: "https://github.com/rails",
  fork: false,
  stars: 45600,
  language: "ruby",
  license: "mit"
}
|> Repo.insert!()

%GitRepo{
  name: "ruby",
  url: "https://github.com/ruby/ruby",
  owner_login: "ruby",
  owner_url: "https://github.com/ruby",
  fork: false,
  stars: 16800,
  language: "ruby",
  license: "bsdl"
}
|> Repo.insert!()
