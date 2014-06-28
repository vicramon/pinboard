class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  authem_for :user
  def deny_user_access
    redirect_to :sign_in
  end

end
