# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:user_empty_first_name) { FactoryBot.build(:user, first_name: '') }
  let(:user_empty_last_name) { FactoryBot.build(:user, last_name: '') }
  let(:user_empty_email) { FactoryBot.build(:user, email: '') }
  let(:user_empty_phone_number) { FactoryBot.build(:user, phone_number: '') }

  it 'should have first name or be invalid' do
    expect(user.first_name).not_to eq('')
    expect(user_empty_first_name).not_to be_valid
  end

  it 'should have last name or be invalid' do
    expect(user.last_name).not_to eq('')
    expect(user_empty_last_name).not_to be_valid
  end

  it 'should have email or be invalid' do
    expect(user.email).not_to eq('')
    expect(user_empty_email).not_to be_valid
  end

  it 'should have phone_number' do
    expect(user.phone_number).not_to eq('')
    expect(user_empty_phone_number).not_to be_valid
  end
end
