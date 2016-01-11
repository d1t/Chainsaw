# Preview all emails at http://localhost:3000/rails/mailers/signup_notifier
class SignupNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/signup_notifier/confirmation
  def confirmation_mail
    SignupNotifier.confirmation_mail
  end

end
