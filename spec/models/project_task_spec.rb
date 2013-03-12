require 'spec_helper'

describe ProjectTask do
  describe 'validations' do
    it { should validate_presence_of(:project) }
    it { should validate_presence_of(:task) }
    it { should validate_presence_of(:hours) }
    it { should validate_numericality_of(:hours) }
  end
end
