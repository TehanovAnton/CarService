# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create(:order) }
  let(:order_empty_description) { FactoryBot.build(:order, description: '') }
  let(:order_mechanic_cant_service) { FactoryBot.build(:order, mechanic: FactoryBot.create(:mechanic)) }

  it 'order should have no empty description or be invalid' do
    expect(order.description).not_to eq('')
    expect(order_empty_description).not_to be_valid
  end

  it 'order should have mechanic' do
    expect(order.mechanic).to be
  end

  it 'order should have client' do
    expect(order.client).to be
  end

  it 'order mechanic should can be do choosen service or order invalid' do
    expect(order.mechanic.services).to include(order.service)
    expect(order_mechanic_cant_service).not_to be_valid
  end
end
