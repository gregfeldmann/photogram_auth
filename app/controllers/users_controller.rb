class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    
    # @photos = Photo.where(:user_id => @user.id)
    @photos = @user.photos
  end
  
  def create
    @user = User.new

    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]

    save_status = @user.save

    if save_status == true
      redirect_to("/photos/", :notice => "User created successfully.")
    else
      render("users/new.html.erb")
    end
  end 
end