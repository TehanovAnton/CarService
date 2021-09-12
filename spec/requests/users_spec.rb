require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # before :each do
  #   @user = FactorBot.create(:user)
  #   sign_in @user
  # end

  describe 'GET guest' do
    it 'has a 200 status code' do
      get :guest, params: { locale: :en }
      expect(response.status).to eq(200)
    end

    it 'renders guest' do
      get :guest, params: { locale: :en }

      expect(response).to render_template('guest')
    end
  end

  describe 'GET show_mechanics' do
    it 'has a 200 status code' do
      @request.env['devise.mapping'] = Devise.mappings[:user]

      @user = FactorBot.create(:user)
      @user.confirm!
      sign_in @user

      get :show_mechanics, params: { locale: I18n.locale }
      expect(response.status).to eq(200)
    end
  end
end
