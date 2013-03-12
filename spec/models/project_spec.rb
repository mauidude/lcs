require 'spec_helper'

describe Project do
  subject { FactoryGirl.create(:project) }

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should ensure_length_of(:name).is_at_most(100) }
  end
end
