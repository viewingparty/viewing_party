require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :duration}
    it { should validate_presence_of :api_id}
  end

  describe 'relationships' do
    it {should have_many :parties}
  end

  describe 'instance methods' do
  end
end