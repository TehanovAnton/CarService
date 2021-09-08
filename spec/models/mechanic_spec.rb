# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  mechanic = FactoryBot.create(:mechanic)

  it 'has at least one service' do
    expect(mechanic.services).not_to be_empty
  end

  it 'has first name' do
    expect(mechanic.first_name).not_to eq('')
  end

  it 'has last name' do
    expect(mechanic.last_name).not_to eq('')
  end

  it 'has email' do
    expect(mechanic.last_name).not_to eq('')
  end

  it 'has phone number' do
    expect(mechanic.phone_number).not_to eq('')
  end
end
