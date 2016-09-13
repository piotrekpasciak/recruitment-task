require 'rails_helper'

RSpec.describe Language, type: :model do
  it "is invalid with blank name" do
    expect(build(:language, name: ' ')).not_to be_valid
  end
end
