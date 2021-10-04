# frozen_string_literal: true
require 'elasticsearch/model'

class User < ApplicationRecord
  include Elasticsearch::Model

  validates :password, confirmation: true
  validates :first_name, :last_name, :email,
            :phone_number, exclusion: { in: [''], message: 'must not be blank' }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  def full_name
    "#{first_name} #{last_name}"
  end
end

User.__elasticsearch__.create_index!
