require 'spec_helper'

describe Task do
  subject { FactoryGirl.create(:task) }

  describe 'validations' do
    it { should validate_presence_of(:cost_code) }
    it { should ensure_length_of(:cost_code).is_at_most(10) }
    it { should validate_uniqueness_of(:cost_code).case_insensitive }
    it { should allow_value('13-999').for(:cost_code) }
    it { should_not allow_value('asdf').for(:cost_code).with_message(/must be in the format/) }

    it { should validate_presence_of(:description) }
    it { should ensure_length_of(:description).is_at_most(256) }
  end

  describe '#to_param' do
    its(:to_param) { should eq subject.cost_code }
  end
end
