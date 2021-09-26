# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before :each do
    user.confirm
    sign_in user
  end

  describe 'GET index' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, client_id: user.id } }

    it 'has a 200 status code ' do
      get :index, params: params
      expect(response.status).to eq(200)
    end

    it 'renders index' do
      get :index, params: params
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show_actual_orders' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, client_id: user.id } }

    context('with no orders') do
      it ' does not redirect to show_actual_orders' do
        get :show_actual_orders, params: params
        expect(response).not_to redirect_to(show_actual_orders_path)
      end
    end
  end

  describe 'GET show_services' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, client_id: user.id } }

    it 'has a 200 status code' do
      get :show_services, params: params
      expect(response.status).to eq(200)
    end

    it 'renders show_services' do
      get :show_services, params: params
      expect(response).to render_template(:show_services)
    end
  end

  describe 'GET new' do
    let(:user) { FactoryBot.create(:user) }
    let(:params) { { locale: I18n.locale, client_id: user.id } }

    it 'has a 200 status code' do
      get :new, params: params
      expect(response.status).to eq(200)
    end

    it 'renders new' do
      get :new, params: params
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:user) { FactoryBot.create(:user) }
    let(:mechanic) { FactoryBot.create(:mechanic) }
    let(:service) { FactoryBot.create(:service) }
    let(:order) { FactoryBot.create(:order, mechanic: mechanic, service_id: mechanic.services.first.id, client: user) }
    let(:params) do
      { locale: I18n.locale, client_id: order.client.id, order: {
        client_id: user.id,
        description: 'new order',
        service_order_attributes: { service_id: mechanic.services.first.id },
        mechanic_id: mechanic.id
      } }
    end

    it 'create new Order' do
      expect { post :create, params: params }.to change { Order.count }.by(1)
    end

    it 'has a desired params and redirects to correct page' do
      post :create, params: params
      expect(Order.last.mechanic).to eq(mechanic)
      expect(Order.last.client).to eq(user)
      expect(Order.last.service).to eq(mechanic.services.first)
      expect(response).to redirect_to(show_actual_orders_path)
    end
  end

  describe 'GET edit' do
    let(:user) { FactoryBot.create(:user) }
    let(:order) { FactoryBot.create(:order, client: user) }
    let(:params) do
      { locale: I18n.locale, client_id: order.client.id, id: order.id }
    end

    it 'has a 200 status code' do
      get :edit, params: params
      expect(response.status).to eq(200)
    end

    it 'renders edit' do
      get :edit, params: params
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST update' do
    let(:user) { FactoryBot.create(:user) }
    let(:order) { FactoryBot.create(:order, client: user) }
    let(:params) do
      { locale: I18n.locale, client_id: order.client.id, id: order.id, order: {
        client_id: order.client.id,
        description: order.description,
        service_order_attributes: { service_id: order.service.id },
        mechanic_id: order.mechanic.id
      } }
    end

    it 'has a 302 status code' do
      post :update, params: params
      expect(response.status).to eq(302)
    end

    it 'redirects to show_actual_orders_path if valid order' do
      post :update, params: params
      expect(response).to redirect_to(show_actual_orders_path)
    end
  end

  describe 'POST destroy' do
    let(:user) { FactoryBot.create(:user) }
    let(:order) { FactoryBot.create(:order, client: user) }
    let(:params) do
      { locale: I18n.locale, client_id: order.client.id, id: order.id }
    end

    it 'has a 302 status code' do
      post :destroy, params: params
      expect(response.status).to eq(302)
    end

    it 'redirects to show_actual_orders_path' do
      post :destroy, params: params
      expect(response).to redirect_to(show_actual_orders_path)
    end
  end
end
