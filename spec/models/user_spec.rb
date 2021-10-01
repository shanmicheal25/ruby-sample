require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:words) } 
  end
end
