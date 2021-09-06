# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  order = FactoryBot.create(:order)

  it 'has not empty description' do
    expect(order.description).not_to eq('')
  end

  it 'has mechanic' do
    expect(order.mechanic).to be
  end

  it 'has service' do
    expect(order.mechanic).to be
  end

  it 'has mechanic that can to do choosen service' do
    expect(order.mechanic.services).to include(order.service)
  end
end
