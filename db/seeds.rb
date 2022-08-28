# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'CADASTRANDO MOEDAS'

Coin.create!(
  description: 'Bitcoin',
  acronym: 'BTC',
  url_image: 'https://cdn.pixabay.com/photo/2018/04/02/14/48/bitcoin-logo-3284066_960_720.png'
)

Coin.create!(
  description: 'Ethereum',
  acronym: 'ETH',
  url_image: 'https://spng.subpng.com/20180330/gkq/kisspng-ethereum-bitcoin-cryptocurrency-logo-tether-bitcoin-5abdfe01865749.6048300215224007695503.jpg'
)

Coin.create!(
  description: 'Dash',
  acronym: 'DASH',
  url_image: 'https://seeklogo.com/images/D/dash-logo-4A14989CF5-seeklogo.com.png'
)

Coin.create!(
  description: 'Dogecoin',
  acronym: 'DOG',
  url_image: 'https://upload.wikimedia.org/wikipedia/pt/d/d0/Dogecoin_Logo.png'
)

puts 'MOEDAS CADASTRADAS COM SUCESSO!'
