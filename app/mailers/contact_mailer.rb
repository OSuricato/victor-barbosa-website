class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: 'victor@victorbarbosa.com', subject: @contact.subject)
  end
end
