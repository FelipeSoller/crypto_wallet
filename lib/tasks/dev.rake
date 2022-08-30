namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Excluíndo Banco de Dados existente") { %x(rails db:drop) }
      show_spinner("Criando Banco de Dados") { %x(rails db:create) }
      show_spinner("Migrando tabelas do Banco de Dados") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts 'Você não está em ambiente de desenvolvimento'
    end
  end

  desc 'Cadastra as moedas'
  task add_coins: :environment do

    show_spinner("Cadastrando Moedas") do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'https://cdn.pixabay.com/photo/2018/04/02/14/48/bitcoin-logo-3284066_960_720.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://spng.subpng.com/20180330/gkq/kisspng-ethereum-bitcoin-cryptocurrency-logo-tether-bitcoin-5abdfe01865749.6048300215224007695503.jpg',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://seeklogo.com/images/D/dash-logo-4A14989CF5-seeklogo.com.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Dogecoin',
          acronym: 'DOG',
          url_image: 'https://upload.wikimedia.org/wikipedia/pt/d/d0/Dogecoin_Logo.png',
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc 'Cadastra Mining Types'
  task add_mining_types: :environment do

    show_spinner("Cadastrando Tipos de Mineração") do
      mining_types = [
        {
          description: 'Proof of Work',
          acronym: 'PoW',
        },
        {
          description: 'Proof of Capacity',
          acronym: 'PoC',
        },
        {
          description: 'Proof of Stake',
          acronym: 'PoS',
        },
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("- #{msg_end}")
  end
end
