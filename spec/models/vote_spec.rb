require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'is invalid without value' do
    expect(build(:vote, value: nil)).not_to be_valid
  end

  it 'is invalid without user' do
    expect(build(:vote, user: nil)).not_to be_valid
  end

  it 'is invalid without project' do
    expect(build(:vote, project: nil)).not_to be_valid
  end

  it 'is invalid when value not in range of 1..6' do
    expect(build(:vote, value: 9)).not_to be_valid
  end

  it 'is invalid when user already voted this project' do
    user1 = create(:user)
    user2 = create(:user)
    project = create(:project)

    create(:vote, user: user1, project: project)

    expect(build(:vote, user: user1, project: project)).not_to be_valid

    expect(build(:vote, user: user2, project: project)).to be_valid
  end
end
