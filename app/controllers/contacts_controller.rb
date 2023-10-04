class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save && verify_recaptcha(model: @contact)
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to new_contact_path, notice: "Message sent."
    else
      flash.now[:error] = "There was an error with your submission. Please try again."
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :subject, :message)
  end
end
