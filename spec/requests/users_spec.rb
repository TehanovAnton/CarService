# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    user.confirm
    sign_in user
  end

  describe 'GET guest' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, id: user.id } }

    it 'has a 200 status code' do
      get :guest, params: params
      expect(response.status).to eq(200)
    end

    it 'renders guest' do
      get :guest, params: params

      expect(response).to render_template('guest')
    end
  end

  describe 'GET show_mechanics' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, id: user.id } }

    it 'has a 200 status code' do
      get :show_mechanics, params: params
      expect(response.status).to eq(200)
    end

    it 'render show_mechanics' do
      get :show_mechanics, params: params
      expect(response).to render_template('show_mechanics')
    end
  end

  describe 'GET show_teammates' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, id: user.id } }

    it 'has a 200 statuse code' do
      get :show_teammates, params: params
      expect(response.status).to eq(200)
    end

    it 'renders show_teammates' do
      get :show_teammates, params: params
      expect(response).to render_template('show_teammates')
    end
  end

  describe 'GET edit' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, id: user.id } }

    it 'has a 200 status code' do
      get :edit, params: params
      expect(response.status).to eq(200)
    end

    it 'renders edit' do
      get :edit, params: params
      expect(response).to render_template('edit')
    end
  end

  describe 'POST update' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) do
      { locale: I18n.locale, id: user.id, client: {
        first_name: user.first_name, last_name: user.last_name, phone_number: user.phone_number, email: user.email
      } }
    end

    it 'has a 302 status' do
      post :update, params: params
      expect(response.status).to eq(302)
    end

    it 'redirects to me' do
      post :update, params: params
      expect(response).to redirect_to(me_path)
    end
  end

  describe 'POST destroy' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, id: user.id } }

    it 'has a 302 status' do
      post :destroy, params: params
      expect(response.status).to eq(302)
    end

    it 'redirects to root' do
      post :destroy, params: params
      expect(response).to redirect_to(root_path)
    end
  end
end
