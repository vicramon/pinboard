class Api::BaseController < ApplicationController
  before_filter :require_user

  private

  def render_unauthorized
    render status: 401, text: 'Unauthorized access' and return
  end

end
