require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:content) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:language) } 
  end

  describe 'validates' do
    it { is_expected.to validate_presence_of(:content) } 
  end

end
