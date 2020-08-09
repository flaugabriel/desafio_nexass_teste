require 'rails_helper'

RSpec.describe Stockitem, type: :model do
  context 'validate presence of' do
    it { should validate_presence_of(:quantities) }
    it { should validate_presence_of(:product) }
    it { should validate_presence_of(:store) }
  end

  context 'validate associations' do
    it { should belong_to(:product) }
  end

  context 'validate associations' do
    it { should belong_to(:store) }
  end

  describe 'Not permit min quantities' do
    it 'is a quantities permited' do
      # expect(should Stockitem.new.not_min_quantities).to eq(1)
    end
  end
end