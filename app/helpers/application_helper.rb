module ApplicationHelper
  def date_br(date_us)
    date_us.strftime("%d/%m/%Y")
  end

  def rails_environment
    if Rails.env.development?
      "Desenvolvimento"
    elsif Rails.env.production?
      "Produção"
    else
      "Teste"
    end
  end
end
