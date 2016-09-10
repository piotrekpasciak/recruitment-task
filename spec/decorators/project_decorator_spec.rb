require 'rails_helper'

describe ProjectDecorator do
  let(:user) { create :user }
  let(:user2) { create :user }
  let(:developer) { create(:developer, first_name: 'Zbyszek', last_name: 'Zbyszkowski') }
  let(:project) { create(:project, developer: developer) }

  before(:each) do
    sign_in user
  end

  describe '#current_user_voted?' do
    it "returns false when current_user didn't vote yet" do
      expect(project.decorate.current_user_voted?).to be false
    end

    it "returns true when current_user already voted" do
      create(:vote, project: project, user: user)

      expect(project.decorate.current_user_voted?).to be true
    end
  end

  describe '#current_user_vote' do
    it "returns nil when current_user didn't vote yet" do
      expect(project.decorate.current_user_vote).to be_nil
    end

    it "returns vote when current_user already voted" do
      vote = create(:vote, project: project, user: user)

      expect(project.decorate.current_user_vote).to eql vote
    end
  end

  describe '#avg_vote' do
    it "returns 'None' when there are no votes yet" do
      expect(project.decorate.avg_vote).to eql 'None'
    end

    it "return value in syntax '' when there are votes already" do
      create(:vote, project: project, user: user, value: 5)
      create(:vote, project: project, user: user2, value: 2)

      expect(project.decorate.avg_vote).to eql '3.5 (Votes: 2)'
    end
  end
end
