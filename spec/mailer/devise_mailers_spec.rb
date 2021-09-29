# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :controller do
  it 'sent eamil' do
    Devise.mappings[:user]
    expect { post :create, params: { locale: :en } }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end
end
