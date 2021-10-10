class SearchController < ApplicationController
  skip_before_action :requier_login, only: %i[search]

  def search
    @records = Elasticsearch::Model.search(params[:text], [Service, Mechanic]).records.to_a

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
