require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:groups) }
    it { should have_many(:tasks) }
  end
  describe 'validations' do
    it { should validate_presence_of(:username) }
  end
end
