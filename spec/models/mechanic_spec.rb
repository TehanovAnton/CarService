# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  let(:mechanic) { FactoryBot.create(:mechanic) }
  let(:mechanic_without_services) { FactoryBot.build(:mechanic, service_id: nil) }

  it 'should have at least one service or be invalid' do
    expect(mechanic.services).not_to be_empty
    expect(mechanic_without_services).not_to be_valid
  end
end
