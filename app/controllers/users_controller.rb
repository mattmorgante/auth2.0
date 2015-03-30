class UsersController < ApplicationController
  def new
  end

  def create
    #create a new instance of the model User, sending through the params below
    user = User.new(user_params)
    # if the instantiation works, also create a session and redirect to root
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
    # if it doesn't work, send them right back to the signup page 
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end


