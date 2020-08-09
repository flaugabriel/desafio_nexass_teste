require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validate presence of' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    # it { should validate_presence_of(:list_id) }
    it { should validate_numericality_of(:price).is_greater_than(0) }
  end

  # context 'validate associations' do
    # it { should belong_to(:list) }
  # end
end