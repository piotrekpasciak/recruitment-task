require 'rails_helper'

describe UserDecorator do
  let(:user) { create :user, email: 'user@test.com', admin: false }
  let(:admin) { create :user, email: 'admin@test.com', admin: true }

  describe '#role for user' do
    subject { user.decorate.role }
    it { is_expected.to eq 'User' }
  end

  describe '#role for admin' do
    subject { admin.decorate.role }
    it { is_expected.to eq 'Administrator' }
  end
end
