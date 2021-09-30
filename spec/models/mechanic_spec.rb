# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  let(:mechanic) { FactoryBot.create(:mechanic) }
  let(:mechanic_without_services) { FactoryBot.build(:mechanic, service_id: nil) }

  it 'should have at least one service' do
    expect(mechanic.services).not_to be_empty
  end

  it 'is invalid without services' do
    expect(mechanic_without_services).not_to be_valid
  end

  it 'can have many orders' do
    # in this orders clients will be different
    2.times { FactoryBot.create(:order, mechanic: mechanic, service_id: mechanic.services.first.id) }
    expect(mechanic.orders.count).to be > 1
  end
end
