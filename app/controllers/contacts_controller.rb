class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to new_contact_path, notice: "Message sent."
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :subject, :message)
  end
end
