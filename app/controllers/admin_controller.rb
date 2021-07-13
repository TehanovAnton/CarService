class AdminController < ApplicationController
  def index
    if current_user&.instance_of?(Admin)
      redirect_to me_path
    else
      redirect_to user_index_path
    end
  end
end
