require 'rails_helper'

feature 'filter project process', type: :feature, js: true do
  background do
    project1 = create(:project, name: 'English project')
    project2 = create(:project, name: 'Polish project')
    language1 = create(:language, name: 'English')
    language2 = create(:language, name: 'Polish')

    create(:projects_language, project: project1, language: language1)
    create(:projects_language, project: project2, language: language2)

    user = create(:user)
    login_as user
  end

  scenario "shows Polish project but don't show English one" do
    visit projects_path

    click_on 'Polish'

    expect(page).to have_content 'Polish project'
    expect(page).not_to have_content 'English project'
  end
end
