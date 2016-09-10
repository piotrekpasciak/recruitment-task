require 'rails_helper'

feature 'create vote process', type: :feature, js: true do
  background do
    @project = create(:project)
    @user = create(:user)
    login_as @user
  end

  scenario 'creates vote under project' do
    visit projects_path

    click_on 'Add Vote'

    expect(page).to have_content 'You have successfully added your vote.'
  end

  scenario 'deletes vote under project' do
    create(:vote, project: @project, user: @user)

    visit projects_path

    click_on 'Delete Vote'

    expect(page).to have_content 'You have successfully deleted your vote.'
  end
end
