# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create(:order) }
  let(:order_empty_description) { FactoryBot.build(:order, description: '') }
  let(:order_mechanic_cant_service) { FactoryBot.build(:order, mechanic: FactoryBot.create(:mechanic)) }

  it 'should have not empty description' do
    expect(order.description).not_to eq('')
  end

  it 'is invalid with empty description' do
    expect(order_empty_description).not_to be_valid
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

  it 'is invalid with mechanic that can\'t do choosen service' do
    expect(order_mechanic_cant_service).not_to be_valid
  end
end
