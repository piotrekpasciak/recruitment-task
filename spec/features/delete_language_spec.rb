require 'rails_helper'

feature 'delete language process', type: :feature, js: true do
  background do
    @admin = create(:user, admin: true)
    @user = create(:user, admin: false)
    @language = create(:language)
  end

  scenario 'admin deletes language successfully' do
    login_as @admin

    visit languages_path

    click_on "destroy_language_#{@language.id}"

    expect(page).to have_content 'You have successfully deleted language.'
  end

  scenario "can't visit languages_path without admin privileges" do
    login_as @user

    visit languages_path

    expect(page).not_to have_content 'All languages'
  end
end
