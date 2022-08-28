namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Excluíndo Banco de Dados existente") { %x(rails db:drop) }

      show_spinner("Criando Banco de Dados") { %x(rails db:create) }

      show_spinner("Migrando tabelas do Banco de Dados") { %x(rails db:migrate) }

      show_spinner("Populando Banco de Dados") { %x(rails db:seed) }

    else
      puts 'Você não está em ambiente de desenvolvimento'
    end
  end

  def show_spinner(msg_start, msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("- #{msg_end}")
  end
end
