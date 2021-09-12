require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    @user = FactoryBot.create(:user)
    @user.confirm
    sign_in @user
  end

  describe 'GET guest' do
    it 'has a 200 status code' do
      get :guest, params: { locale: I18n.locale }
      expect(response.status).to eq(200)
    end

    it 'renders guest' do
      get :guest, params: { locale: I18n.locale }

      expect(response).to render_template('guest')
    end
  end

  describe 'GET show_mechanics' do
    it 'has a 200 status code' do
      get :show_mechanics, params: { locale: I18n.locale }
      expect(response.status).to eq(200)
    end
    
    it 'render show_mechanics' do
      get :show_mechanics, params: { locale: I18n.locale }
      expect(response).to render_template('show_mechanics')
    end
  end

  describe 'GET show_teammates' do
    it 'has a 200 statuse code' do
      get :show_teammates, params: { locale: I18n.locale }
      expect(response.status).to eq(200)
    end

    it 'renders show_teammates' do
      get :show_teammates, params: { locale: I18n.locale }
      expect(response).to render_template('show_teammates')
    end
  end
end
