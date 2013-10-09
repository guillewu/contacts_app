class UsersController < ApplicationController
  def index
    @users = User.all
    render :json => @users
  end

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
     render :json => user.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render :json => user
    else
      render :json => user.errors.full_messages
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      render :json => user
    else
      render :json => user.errors
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render :json => "true"
  end

  def favorites
    user = User.find(params[:id])
    fav_contacts = user.contacts.where(favorite: true)

    render :json => fav_contacts
  end

end
