class HomeController < ApplicationController
  before_filter :redirect_if_signed_in

  private

  def redirect_if_signed_in
    redirect_to :boards if current_user
  end

end
