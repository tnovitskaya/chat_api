require 'spec_helper'

describe User do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  it { is_expected.to respond_to(:username) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }

  it { is_expected.to be_valid }

  it { expect(subject).to validate_presence_of :username }
  it { expect(subject).to validate_uniqueness_of :username }
  it { expect(subject).to validate_confirmation_of :password }
  it { expect(subject).to ensure_length_of :password }
end
