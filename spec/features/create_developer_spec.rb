require 'rails_helper'

feature 'create developer process', type: :feature, js: true do
  background do
    user = create(:user)
    login_as user
  end

  scenario 'creates developer successfully by upload with jpg file' do
    visit new_developer_path

    fill_in "developer_first_name", with: "John"
    fill_in "developer_last_name", with: "Doe"

    attach_file("developer_avatar", Rails.root + "spec/fixtures/files/cat.jpg")

    click_on 'Create Developer'

    expect(page).to have_content 'Developer saved.'
  end


  scenario "doesn't create user when txt file is uploaded" do
    visit new_developer_path

    fill_in "developer_first_name", with: "John"
    fill_in "developer_last_name", with: "Doe"

    attach_file("developer_avatar", Rails.root + "spec/fixtures/files/cat.txt")

    click_on 'Create Developer'

    expect(page).to have_content 'Developer could not be saved.'
  end
end
