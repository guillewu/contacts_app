class ContactsController < ApplicationController
  def index
    @contacts = Contact.contacts_for_user_id(params[:user_id])
    render :json => @contacts
  end

  def create
    contact = Contact.new(params[:contact])
    Contact.new()
    if contact.save
      render :json => contact
    else
     render :json => contact.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    contact = Contact.find(params[:id])
    if contact
      render :json => contact
    else
      render :json => contact.errors.full_messages
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(params[:contact])
      render :json => contact
    else
      render :json => contact.errors
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render :json => "success"
  end

  def favorite
    contact = Contact.find(params[:id])
    contact.update_attributes(favorite: true)
    render :json =>  contact
  end

  def unfavorite
    contact = Contact.find(params[:id])
    contact.update_attributes(favorite: false)
    render :json =>  contact

  end

end
