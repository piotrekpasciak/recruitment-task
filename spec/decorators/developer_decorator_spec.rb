require 'rails_helper'

describe DeveloperDecorator do
  let(:developer) { create :developer, first_name: 'Zbyszek', last_name: 'Zbyszkowski' }

  describe '#full_name' do
    subject { developer.decorate.full_name }
    it { is_expected.to eq 'Zbyszek Zbyszkowski' }
  end
end
