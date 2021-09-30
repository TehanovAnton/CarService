# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:service) { FactoryBot.create(:service) }
  let(:order_with_specific_service) { FactoryBot.create(:order, service_id: service.id) }

  let(:mechanic) { FactoryBot.create(:mechanic) }
  let(:order_with_specific_mechahic) { FactoryBot.create(:order, mechanic: mechanic, service_id: mechanic.services.first.id) }

  let(:client) { FactoryBot.create(:client) }
  let(:order_with_specific_client) { FactoryBot.create(:order, client: client) }

  let(:order) { FactoryBot.create(:order) }
  let(:order_with_empty_description) { FactoryBot.build(:order, description: '') }
  let(:order_with_unsupproted_service) { FactoryBot.build(:order, mechanic: FactoryBot.create(:mechanic)) }

  it 'should have description' do
    expect(order.description).not_to be_blank
  end

  it 'is invalid with empty description' do
    expect(order_with_empty_description).not_to be_valid
  end

  it 'should have mechanic' do
    expect(order.mechanic).to be
  end

  it 'should have client' do
    expect(order.client).to be
  end

  it 'mechanic should can do choosen service' do
    expect(order.mechanic.services).to include(order.service)
  end

  it 'is invalid with unsupported service' do
    expect(order_with_unsupproted_service).not_to be_valid
  end

  it 'service stored corectly' do
    expect(order_with_specific_service.service).to eq(service)
  end

  it 'mechanic stored corectly' do
    expect(order_with_specific_mechahic.mechanic).to eq(mechanic)
  end

  it 'client stored corectly' do
    expect(order_with_specific_client.client).to eq(client)
  end
end
