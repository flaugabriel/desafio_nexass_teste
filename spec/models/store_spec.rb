require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'validate presence of' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:neighborhood) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:cep) }
  end
end