class AuthMailer < ApplicationMailer
  def send_recovery_password_email(resource, password)
    @resource = resource
    @password = password
    mail(to: @resource.email, subject: 'Redefinição de senha')
  end
end
