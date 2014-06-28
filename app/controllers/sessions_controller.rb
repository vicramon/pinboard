class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in(user, remember: true)
      redirect_back_or_to(:boards)
    else
      flash.now.alert = "Your email and password do not match"
      render :new
    end
  end

  def destroy
    sign_out_user
    redirect_to :root
  end

end
