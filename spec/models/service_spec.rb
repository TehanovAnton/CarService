# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:service) { FactoryBot.create(:service) }
  let(:service_with_blank_title) { FactoryBot.build(:service, title: '') }
  let(:service_with_negative_price) { FactoryBot.build(:service, price: -1) }
  let(:service_with_zero_price) { FactoryBot.build(:service, price: 0) }

  it 'has not blank title' do
    expect(service.title).not_to eq('')
  end

  it 'is invalid with blank title' do
    expect(service_with_blank_title).not_to be_valid
  end

  it 'has price value more than 0' do
    expect(service.price).to be > 0
  end

  it 'is invalid with negative price value ' do
    expect(service_with_negative_price).not_to be_valid
  end

  it 'is invalid with zero price ' do
    expect(service_with_zero_price).not_to be_valid
  end
end
