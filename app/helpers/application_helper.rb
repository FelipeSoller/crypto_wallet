module ApplicationHelper
  def date_br(date_us)
    date_us.strftime("%d/%m/%Y")
  end

  def rails_environment
    if Rails.env.development?
      t("environment.development")
    elsif Rails.env.production?
      t("environment.production")
    else
      t("environment.test")
    end
  end

  # def locale
  #   I18n.locale == :en ? "Inglês" : "Português"
  # end
end
