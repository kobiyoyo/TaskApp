# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_and_belong_to_many(:groups) }
  end
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:hours) }
    it { should validate_presence_of(:author_id) }
  end
end
