require 'rails_helper'

feature 'create project process', type: :feature, js: true do
  background do
    @developer = create(:developer)

    3.times do
      create(:language)
    end

    user = create(:user)
    login_as user
  end

  scenario 'creates projects successfully with selected languages' do
    visit new_developer_project_path(@developer)

    fill_in 'project_name', with: 'Awesome project'
    fill_in 'project_description', with: 'Awesome project description'
    check 'project_language_ids_1'
    check 'project_language_ids_3'

    click_on 'Create Project'

    expect(page).to have_content 'Project saved.'
  end

  scenario "doesn't create project when name is not unique per developer" do
    create(:project, name: 'Name taken', developer: @developer)

    visit new_developer_project_path(@developer)

    fill_in 'project_name', with: 'Name taken'
    fill_in 'project_description', with: 'Description not taken'
    check 'project_language_ids_1'
    check 'project_language_ids_3'

    click_on 'Create Project'

    expect(page).to have_content 'Project could not be saved.'
  end
end
