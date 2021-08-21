class FakesController < ApplicationController
  skip_before_action :requier_login

  def index
  end

  def example
    flash[:notice] = t :hello_flash
  end
end