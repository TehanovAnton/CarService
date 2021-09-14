# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before :each do
    @user = FactoryBot.create(:user)
    @user.confirm
    @params = { locale: I18n.locale, client_id: @user.id }
    sign_in @user
  end

  before 'POST create' do
    @order = FactoryBot.create(:order)
    @order_params = { locale: I18n.locale, order: {
      client_id: @order.client.id,
      description: @order.description,
      service_order_attributes: { service_id: @order.service.id },
      mechanic_id: @order.mechanic.id
    }, client_id: @order.client.id }
  end

  describe 'GET index' do
    it 'has a 200 status code ' do
      get :index, params: @params
      expect(response.status).to eq(200)
    end

    it 'renders index' do
      get :index, params: @params
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show_actual_orders' do
    it 'redirects to root_path if has no orders' do
      get :show_actual_orders, params: @params
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET show_services' do
    it 'has a 200 status code' do
      get :show_services, params: @params
      expect(response.status).to eq(200)
    end

    it 'renders show_services' do
      get :show_services, params: @params
      expect(response).to render_template(:show_services)
    end
  end

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new, params: @params
      expect(response.status).to eq(200)
    end

    it 'renders new' do
      get :new, params: @params
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    it 'has a 302 status code' do
      post :create, params: @order_params
      expect(response.status).to eq(302)
    end

    it 'redirects to show_actual_orders_path' do
      post :create, params: @order_params

      expect(response).to redirect_to(show_actual_orders_path)
    end
  end
end
