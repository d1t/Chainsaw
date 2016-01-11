class SignupNotifier < Devise::Mailer
	helper :application
	include Devise::Controllers::UrlHelpers
	default template_path: 'devise/mailer'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_notifier.confirmation.subject
  #
  def confirmation_mail(partner)
    @partner = partner
   
    mail to: partner.email, subject: 'Welcome to Cubey' 
  end
end
