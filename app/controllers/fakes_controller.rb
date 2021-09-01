# frozen_string_literal: true

class FakesController < ApplicationController
  skip_before_action :requier_login

  def index; end

  def example
    flash[:notice] = t :hello_flash
  end

  def example_post
    redirect_to example_path
  end
end
