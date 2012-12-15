class HomesController < ApplicationController
  before_filter :authenticate_admin_user!

  def index
    
  end

end
