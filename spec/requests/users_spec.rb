require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :each do
    @user = FactoryBot.create(:user)
    @user.confirm
    @params = { locale: I18n.locale, id: @user.id }
    sign_in @user
  end

  describe 'GET guest' do
    it 'has a 200 status code' do
      get :guest, params: @params
      expect(response.status).to eq(200)
    end

    it 'renders guest' do
      get :guest, params: @params

      expect(response).to render_template('guest')
    end
  end

  describe 'GET show_mechanics' do
    it 'has a 200 status code' do
      get :show_mechanics, params: @params
      expect(response.status).to eq(200)
    end

    it 'render show_mechanics' do
      get :show_mechanics, params: @params
      expect(response).to render_template('show_mechanics')
    end
  end

  describe 'GET show_teammates' do
    it 'has a 200 statuse code' do
      get :show_teammates, params: @params
      expect(response.status).to eq(200)
    end

    it 'renders show_teammates' do
      get :show_teammates, params: @params
      expect(response).to render_template('show_teammates')
    end
  end

  describe 'GET edit' do
    it 'has a 200 status code' do
      get :edit, params: { locale: I18n.locale, id: @user.id }
      expect(response.status).to eq(200)
    end

    it 'renders edit' do
      get :edit, params: { locale: I18n.locale, id: @user.id }
      expect(response).to render_template('edit')
    end
  end

  describe 'POST update' do
    it 'has a 302 status' do
      @params[:client] = { first_name: @user.first_name, last_name: @user.last_name, phone_number: @user.phone_number, email: @user.email }
      post :update, params: @params
      expect(response.status).to eq(302)
    end

    it 'redirects to me' do
      @params[:client] = { first_name: @user.first_name, last_name: @user.last_name, phone_number: @user.phone_number, email: @user.email }
      post :update, params: @params
      expect(response).to redirect_to(me_path)
    end
  end

  describe 'POST destroy' do
    it 'has a 302 status' do
      post :destroy, params: @params
      expect(response.status).to eq(302)
    end

    it 'redirects to root' do
      @params[:client] = @user
      post :destroy, params: @params
      expect(response).to redirect_to(root_path)
    end
  end
end