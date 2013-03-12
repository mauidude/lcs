require 'spec_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should ensure_length_of(:first_name).is_at_most(20) }

    it { should validate_presence_of(:last_name) }
    it { should ensure_length_of(:last_name).is_at_most(20) }

    describe "#email" do
      subject { FactoryGirl.create :user }
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of(:email).case_insensitive.with_message("has already been registered") }
      it { should ensure_length_of(:email).is_at_most 100 }

      %w(test@test.com test@test.asdf.com first.last@test.com).each do |email|
        it { should validate_format_of(:email).with(email) }
      end

      %w(inval\ id@test.com invalid test@ @test.com invalid@test ).each do |email|
        it { should_not validate_format_of(:email).with(email).with_message(/not\sa\svalid/) }
      end
    end

    describe "#password" do
      it { should validate_presence_of :password }
      it { should validate_confirmation_of :password }
      it { should ensure_length_of(:password).is_at_least(8).is_at_most(15) }
    end
  end

  describe '#name' do
    its(:name) { should eq "#{subject.first_name} #{subject.last_name}" }
  end
end
