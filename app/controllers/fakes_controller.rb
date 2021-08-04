class FakesController < ApplicationController
  skip_before_action :requier_login
  def index
  end
end