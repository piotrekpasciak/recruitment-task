require 'rails_helper'

describe DeveloperDecorator do
  let(:developer) { create :developer, first_name: 'Zbyszek', last_name: 'Zbyszkowski', created_at: 'Mon June 1 12:03:08 -0700 2016' }

  describe '#full_name' do
    subject { developer.decorate.full_name }
    it { is_expected.to eq 'Zbyszek Zbyszkowski' }
  end

  describe '#creation_date' do
    subject { developer.decorate.creation_date }
    it { is_expected.to eq '01/06/2016' }
  end
end
