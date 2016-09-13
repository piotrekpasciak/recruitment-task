require 'rails_helper'

feature 'delete user process', type: :feature, js: true do
  background do
    @admin = create(:user, admin: true)
    @user = create(:user)

    project = create(:project)
    create(:vote, project: project)
  end

  scenario 'deletes user with user' do
    login_as @admin

    visit users_path

    click_on "destroy_user_#{@user.id}"

    expect(page).to have_content 'You have successfully deleted user.'
  end

  scenario "can't visit users_path without admin privileges" do
    login_as @user

    visit users_path

    expect(page).not_to have_content 'All users'
  end
end
