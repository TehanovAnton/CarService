# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  service = FactoryBot.create(:service)

  it 'has not blank title' do
    expect(service.title).not_to eq('')
  end

  it 'has price value more than 0' do
    expect(service.price).not_to be < 0
  end
end
